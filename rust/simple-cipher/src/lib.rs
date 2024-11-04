use rand::Rng;

pub fn encode(key: &str, s: &str) -> Option<String> {
    validate_key(key)
        .map(|key|transform(key, s, |idx, shift_idx| idx + shift_idx))
}

pub fn decode(key: &str, s: &str) -> Option<String> {
    validate_key(key)
        .map(|key|transform(key, s, |idx, shift_idx| idx - shift_idx))
}

pub fn encode_random(s: &str) -> (String, String) {
    let key = generate_key();
    let encoded = encode(key.as_str(), s).unwrap();
    (key, encoded)
}

fn generate_key() -> String {
    let mut rng = rand::thread_rng();
    (0..100).map(|_| rng.gen_range('a'..='z')).collect()
}

fn transform(key: &str, s: &str, op: fn(u8, u8) -> u8) -> String {
    let key_shifts: Vec<u8> = key.chars().cycle().take(s.len()).map(|c| c as u8 - b'a').collect();
    let mut encoded = String::with_capacity(s.len());

    for (i, c) in s.chars().enumerate() {
        encoded.push((b'a' + ((op(26 + (c as u8 - b'a'), key_shifts[i])) % 26)) as char)
    }

    encoded
}

fn validate_key(key: &str) -> Option<&str> {
    if key.is_empty() || key.chars().any(|c| !c.is_ascii_lowercase()) {
        return None
    }

    Some(key)
}

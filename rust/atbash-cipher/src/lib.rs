pub fn encode(plain: &str) -> String {
    encode_letters(plain)
        .chunks(5)
        .map(|chunk| chunk.iter().collect())
        .collect::<Vec<String>>()
        .join(" ")
}

pub fn decode(cipher: &str) -> String {
    cipher.chars().filter_map(encode_letter).collect()
}

fn encode_letters(plain: &str) -> Vec<char> {
    plain
        .to_lowercase()
        .chars()
        .filter_map(encode_letter)
        .collect()
}

fn encode_letter(letter: char) -> Option<char> {
    if letter.is_ascii_digit() {
        Some(letter)
    } else if letter.is_ascii_alphabetic() {
        Some((b'z' - (letter as u8 - b'a')) as char)
    } else {
        None
    }
}

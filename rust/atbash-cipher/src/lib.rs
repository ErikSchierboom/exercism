pub fn encode(plain: &str) -> String {
    let encoded_letters: Vec<char> = plain
        .to_lowercase()
        .chars()
        .filter_map(encode_letter)
        .collect();
    let chunked_letters = encoded_letters.chunks(5);
    let chunks: Vec<String> = chunked_letters
        .map(|chunk| chunk.iter().collect())
        .collect();
    chunks.join(" ")
}

pub fn decode(cipher: &str) -> String {
    cipher.chars().filter_map(encode_letter).collect()
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

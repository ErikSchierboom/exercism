use std::collections::HashSet;

pub fn is_pangram(sentence: &str) -> bool {
    let mut letters: HashSet<char> = ('a'..='z').collect();

    for c in sentence.chars() {
        letters.remove(&c.to_ascii_lowercase());
    }

    letters.is_empty()
}

use std::collections::HashSet;

pub fn check(candidate: &str) -> bool {
    let mut letters = HashSet::new();

    candidate.chars()
        .filter(|character| character.is_ascii_alphabetic())
        .map(|letter| letter.to_ascii_lowercase())
        .all(|letter| letters.insert(letter))
}

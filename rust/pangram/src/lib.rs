use std::collections::HashSet;

pub fn is_pangram(sentence: &str) -> bool {
    ('a'..='z').collect::<HashSet<char>>().is_subset(&sentence.to_ascii_lowercase().chars().collect())
}

use std::collections::HashSet;

pub fn anagrams_for<'a>(word: &str, possible_anagrams: &[&'a str]) -> HashSet<&'a str> {
    possible_anagrams
        .iter()
        .filter(|possible_anagram| is_anagram(word, *possible_anagram))
        .cloned()
        .collect()
}

fn is_anagram(word: &str, other_word: &str) -> bool {
    word.to_lowercase() != other_word.to_lowercase() &&
        sorted_lowercase_string(word) == sorted_lowercase_string(other_word)
}

fn sorted_lowercase_string(word: &str) -> String {
    let mut chars: Vec<char> = word.to_lowercase().chars().collect();
    chars.sort();
    return String::from_iter(chars);
}

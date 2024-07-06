use regex_lite::Regex;

pub fn abbreviate(phrase: &str) -> String {
    Regex::new(r"[A-Z]+[a-z']*|[a-z]+").unwrap()
        .find_iter(phrase)
        .map(|c| c.as_str().to_ascii_uppercase().chars().next().unwrap())
        .collect()
}

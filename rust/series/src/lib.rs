pub fn series(digits: &str, len: usize) -> Vec<String> {
    digits
        .chars()
        .collect::<Vec<_>>()
        .windows(len)
        .map(|w| w.iter().collect())
        .collect()
}

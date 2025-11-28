pub fn number(user_number: &str) -> Option<String> {
    let mut digits: Vec<char> = user_number
        .chars()
        .filter(|c| !matches!(c, '+' | ' ' | '-' | '.' | '(' | ')'))
        .try_fold(vec![], |mut acc, c| {
            if c.is_ascii_digit() {
                acc.push(c);
                Some(acc)
            } else {
                None
            }
        })?
        .into_iter()
        .collect();

    if digits.len() == 11 && digits[0] == '1' {
        digits.remove(0);
    }

    if digits.len() != 10 || matches!(digits[0], '0' | '1') || matches!(digits[3], '0' | '1') {
        None
    } else {
        Some(digits.iter().collect())
    }
}

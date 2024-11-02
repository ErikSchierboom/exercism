pub fn is_valid(code: &str) -> bool {
    parse_digits(code)
        .and_then(check_length)
        .map(valid_checksum)
        .unwrap_or(false)
}

fn parse_digits(input: &str) -> Option<Vec<u32>> {
    input.chars()
        .filter(|c| !c.is_whitespace())
        .map(|c| c.to_digit(10))
        .collect()
}

fn check_length(digits: Vec<u32>) -> Option<Vec<u32>> {
    if digits.len() > 1 { Some(digits) } else { None}
}

fn valid_checksum(digits: Vec<u32>) -> bool {
    fn correct_digit(idx: usize, digit: u32) -> u32 {
        let doubled =  if idx % 2 == 1 { digit * 2 } else { digit };
        if doubled > 9 { doubled - 9 } else { doubled }
    }

    digits.iter()
        .rev()
        .enumerate()
        .map(|(i, d)| { correct_digit(i, *d)})
        .sum::<u32>() % 10 == 0
}

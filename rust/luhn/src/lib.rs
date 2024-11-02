pub fn is_valid(code: &str) -> bool {
    parse_digits(code)
        .filter(|digits| digits.len() > 1)
        .map(|digits| checksum(digits) % 10 == 0)
        .unwrap_or(false)
}

fn parse_digits(slice: &str) -> Option<Vec<u32>> {
    slice.chars()
        .filter(|c| !c.is_whitespace())
        .map(|c| c.to_digit(10))
        .collect()
}

fn checksum(digits: Vec<u32>) -> u32 {
    digits.iter()
        .rev()
        .enumerate()
        .map(|(i, &digit)| if i % 2 == 0 { digit } else { digit * 2 })
        .map(|digit| if digit > 9 { digit - 9 } else { digit })
        .sum::<u32>()
}

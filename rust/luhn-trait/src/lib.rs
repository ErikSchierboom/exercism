pub trait Luhn {
    fn valid_luhn(&self) -> bool;
}

impl<T: ToString> Luhn for T {
    fn valid_luhn(&self) -> bool {
        is_valid(self.to_string())
    }
}


fn is_valid(string: String) -> bool {
    digits(string)
        .filter(|digits| digits.len() > 1)
        .map(|digits| checksum(digits) % 10 == 0)
        .  unwrap_or(false)
}

fn digits(string: String) -> Option<Vec<u32>> {
    string
        .chars()
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
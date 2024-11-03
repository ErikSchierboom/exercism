use std::convert::From;

pub struct Luhn(String);

impl Luhn {
    pub fn is_valid(&self) -> bool {
        self.digits()
            .filter(|digits| digits.len() > 1)
            .map(|digits| self.checksum(digits) % 10 == 0)
            .unwrap_or(false)
    }

    fn digits(&self) -> Option<Vec<u32>> {
        self.0
            .chars()
            .filter(|c| !c.is_whitespace())
            .map(|c| c.to_digit(10))
            .collect()
    }

    fn checksum(&self, digits: Vec<u32>) -> u32 {
        digits.iter()
            .rev()
            .enumerate()
            .map(|(i, &digit)| if i % 2 == 0 { digit } else { digit * 2 })
            .map(|digit| if digit > 9 { digit - 9 } else { digit })
            .sum::<u32>()
    }

}

impl<T: ToString> From<T> for Luhn {
    fn from(input: T) -> Self {
        Self(input.to_string())
    }
}

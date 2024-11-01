use crate::Error::InvalidDigit;

#[derive(Debug, PartialEq, Eq)]
pub enum Error {
    InvalidInputBase,
    InvalidOutputBase,
    InvalidDigit(u32),
}

fn to_decimal(number: &[u32], input_base: u32) -> Result<u32, Error> {
    number.iter().try_fold(0, |acc, &n| {
        if n >= input_base {
            Err(InvalidDigit(n))
        } else {
            Ok(acc * input_base + n)
        }
    })
}

fn from_decimal(decimal: u32, output_base: u32) -> Vec<u32> {
    let mut digits = Vec::new();
    let mut remainder = decimal;

    while remainder > 0 {
        digits.push(remainder % output_base);
        remainder = remainder / output_base
    }

    if digits.is_empty() { return vec!(0) }

    digits.reverse();
    digits
}

pub fn convert(number: &[u32], input_base: u32, output_base: u32) -> Result<Vec<u32>, Error> {
    if input_base < 2 { return Err(Error::InvalidInputBase) }
    if output_base < 2 { return Err(Error::InvalidOutputBase) }

    to_decimal(number, input_base).map(|decimal| from_decimal(decimal, output_base))
}

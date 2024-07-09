use itertools::Itertools;
use std::fmt::Write;

pub fn encode(source: &str) -> String {
    let mut encoded = String::new();

    for (char, group) in source.chars().chunk_by(|&a| a).into_iter() {
        match group.count() {
            1 => write!(&mut encoded, "{}", char).unwrap(),
            n => write!(&mut encoded, "{}{}", n, char).unwrap(),
        }
    }

    return encoded;
}

pub fn decode(source: &str) -> String {
    let mut decoded = String::new();
    let mut number = 0;

    for c in source.chars() {
        if c.is_numeric() {
            number = number * 10 + c.to_digit(10).unwrap();
        } else {
            if number == 0 {
                write!(&mut decoded, "{}", c).unwrap()
            } else {
                write!(&mut decoded, "{}", c.to_string().repeat(number as usize)).unwrap()
            }

            number = 0
        }
    }

    decoded
}

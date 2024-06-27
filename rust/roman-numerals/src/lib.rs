use std::fmt::{Display, Formatter, Result, Write};

pub struct Roman {
    decimal: u32,
}

const ROMAN_NUMERALS: [(u32, &str); 13] = [
    (1000, "M"),
    (900, "CM"),
    (500, "D"),
    (400, "CD"),
    (100, "C"),
    (90, "XC"),
    (50, "L"),
    (40, "XL"),
    (10, "X"),
    (9, "IX"),
    (5, "V"),
    (4, "IV"),
    (1, "I"),
];

impl Display for Roman {
    fn fmt(&self, f: &mut Formatter<'_>) -> Result {
        let mut remainder = self.decimal;

        Ok(for (threshold, numeral) in ROMAN_NUMERALS {
            while remainder / threshold > 0 {
                remainder -= threshold;
                f.write_str(numeral)?
            }
        })
    }
}

impl From<u32> for Roman {
    fn from(num: u32) -> Self {
        Self { decimal: num }
    }
}

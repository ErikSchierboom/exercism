use std::cmp::Ordering;
use std::ops::{Add, Mul, Sub};
use num_bigint::BigInt;

#[derive(Clone, Debug)]
pub struct Decimal {
    digits: BigInt,
    precision: usize
}

impl Decimal {
    pub fn try_from(input: &str) -> Option<Decimal> {
        let mut digits = String::with_capacity(input.len());
        let mut precision = 0;

        for (i, c) in input.chars().enumerate() {
            if c == '.' {
                precision = input.len() - 1 - i
            } else {
                digits.push(c)
            }
        }

        let digits = digits.parse().ok()?;
        Some(Self { digits, precision })
    }

    fn matching_precisions(&self, other: &Self) -> (Self, Self) {
        match self.precision.cmp(&other.precision) {
            Ordering::Less => (self.extend_precision(&other), other.clone()),
            Ordering::Greater => (self.clone(), other.extend_precision(&self)),
            Ordering::Equal => (self.clone(), other.clone())
        }
    }

    fn extend_precision(&self, other: &Self) -> Self {
        assert!(self.precision < other.precision);

        let extend_precision_by = other.precision - self.precision;
        let digits = self.digits.clone() * BigInt::from(10).pow(extend_precision_by as u32);

        Self { digits, precision: other.precision }
    }
}

impl PartialEq for Decimal {
    fn eq(&self, other: &Self) -> bool {
        let (lhs, rhs) = self.matching_precisions(other);
        lhs.digits.eq(&rhs.digits)
    }
}

impl PartialOrd for Decimal {
    fn partial_cmp(&self, other: &Self) -> Option<Ordering> {
        let (lhs, rhs) = self.matching_precisions(other);
        lhs.digits.partial_cmp(&rhs.digits)
    }
}

impl Add for Decimal {
    type Output = Self;

    fn add(self, rhs: Self) -> Self::Output {
        let (mut lhs, rhs) = self.matching_precisions(&rhs);
        lhs.digits += rhs.digits;
        lhs
    }
}

impl Sub for Decimal {
    type Output = Self;

    fn sub(self, rhs: Self) -> Self::Output {
        let (mut lhs, rhs) = self.matching_precisions(&rhs);
        lhs.digits -= rhs.digits;
        lhs
    }
}

impl Mul for Decimal {
    type Output = Self;

    fn mul(self, rhs: Self) -> Self::Output {
        let (mut lhs, rhs) = self.matching_precisions(&rhs);
        lhs.digits *= rhs.digits;
        lhs.precision += rhs.precision;
        lhs
    }
}

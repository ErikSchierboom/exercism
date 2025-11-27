use std::collections::HashSet;

#[derive(Debug, Clone, PartialEq, Eq)]
pub struct Palindrome {
    value: u64,
    factors: HashSet<(u64, u64)>
}

impl Palindrome {
    pub fn value(&self) -> u64 {
        self.value
    }

    pub fn into_factors(self) -> HashSet<(u64, u64)> {
        self.factors
    }
}

pub fn palindrome_products(min: u64, max: u64) -> Option<(Palindrome, Palindrome)> {
    let mut smallest: Palindrome = Palindrome { value: u64::MAX, factors: HashSet::new() };
    let mut largest: Palindrome = Palindrome { value: u64::MIN, factors: HashSet::new() };

    for x in min..=max {
        for y in x..=max {
            let product = x * y;

            if product < largest.value && product > smallest.value {
                continue
            }

            if is_palindrome(product) {
                if product >= largest.value {
                    if product > largest.value {
                        largest.factors.clear()
                    }

                    largest.value = product;
                    largest.factors.insert((x, y));
                }

                if product <= smallest.value {
                    if product < smallest.value() {
                        smallest.factors.clear()
                    }

                    smallest.value = product;
                    smallest.factors.insert((x, y));
                }
            }
        }
    }

    if smallest.factors.is_empty() {
        None
    } else {
        Some((smallest, largest))
    }
}

fn is_palindrome(num: u64) -> bool {
    let mut n = num;
    let mut rev = 0;

    while n > 0 {
        rev = rev * 10 + (n % 10);
        n /= 10;
    }

    num == rev
}

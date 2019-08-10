pub fn factors(n: u64) -> Vec<u64> {
    let mut found_factors: Vec<u64> = Vec::new();
    let mut factor = 2;
    let mut remainder = n;

    while remainder > 1 {
        while remainder % factor != 0 {
            factor += if factor == 2 { 1 } else { 2 };
        }

        remainder /= factor;
        found_factors.push(factor);
    }

    found_factors
}

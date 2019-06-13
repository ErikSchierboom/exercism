pub fn sum_of_multiples(limit: u32, factors: &[u32]) -> u32 {
    (1..limit).filter(|n| is_multiple(*n, &factors)).sum()
}

fn is_multiple(n: u32, factors: &[u32]) -> bool {
    factors.iter().any(|factor| *factor != 0 && n % *factor == 0)
}

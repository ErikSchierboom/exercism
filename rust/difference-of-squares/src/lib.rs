pub fn square_of_sum(n: u32) -> u32 {
    square((1..=n).sum())
}

pub fn sum_of_squares(n: u32) -> u32 {
    (1..=n).map(|i| square(i)).sum()
}

pub fn difference(n: u32) -> u32 {
    square_of_sum(n) - sum_of_squares(n)
}

fn square(n: u32) -> u32 {
    n * n
}

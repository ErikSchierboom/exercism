pub fn collatz(n: u64) -> Option<u64> {
    fn inner(current: u64, steps: u64) -> Option<u64> {
        match current {
            0 => None,
            1 => Some(steps),
            n if n % 2 == 0 => inner(n / 2, steps + 1),
            n => inner(3 * n + 1, steps + 1),
        }
    }

    inner(n, 0)
}

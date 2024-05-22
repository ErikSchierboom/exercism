pub fn collatz(n: u64) -> Option<u64> {
    if n < 1 { return None }

    let mut steps = 0;
    let mut n = n;

    while n != 1 {
        n = if n % 2 == 0 { n / 2 } else { 3 * n + 1 };
        steps += 1
    }

    Some(steps)
}

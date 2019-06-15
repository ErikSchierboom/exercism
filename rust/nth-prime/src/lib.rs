pub fn nth(n: u32) -> u32 {
    if n == 0 {
        return 2
    }

    if n == 1 {
        return 3
    }

    let mut pivot = 6;
    let mut found_primes = 2;

    loop {
        let pivot_minus_one = pivot - 1;
        if is_prime(pivot_minus_one) {
            found_primes += 1;

            if found_primes == n + 1 {
                return pivot_minus_one
            }
        }

        let pivot_plus_one = pivot + 1;
        if is_prime(pivot_plus_one) {
            found_primes += 1;

            if found_primes == n + 1 {
                return pivot_plus_one
            }
        }

        pivot += 6
    }

}

fn is_prime(n: u32) -> bool {
    let r = (n as f32).sqrt().floor() as u32;
    (5 ..= r).step_by(2).all(|x| n % x != 0)
}

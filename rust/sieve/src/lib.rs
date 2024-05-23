pub fn primes_up_to(upper_bound: u64) -> Vec<u64> {
    let mut sieve = vec![true; (upper_bound + 1) as usize];
    let mut primes = Vec::new();

    (2usize..=upper_bound as usize).for_each(|i| {
        if sieve[i] {
            primes.push(i as u64);
            (i*i..=upper_bound as usize).step_by(i).for_each(|j| {
                sieve[j] = false;
            });
        }
    });

    primes
}

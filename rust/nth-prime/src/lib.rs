pub fn nth(n: u32) -> u32 {
    primes().nth(n as usize).unwrap()
}

struct Prime {
    number: u32,
    previous: u32,
}

impl Prime {
    fn next(&mut self) -> u32 {
        let current = self.number;

        if self.number == 2 {
            self.number = 3;
        } else if self.number == 3 {
            self.number = 5;
        } else if self.number == 5 {
            self.number = 7;
        } else if self.number - 2 == self.previous {
            self.number += 4;
        } else {
            self.number += 2;
        }

        self.previous = current;
        self.previous
    }
}

impl Iterator for Prime {
    type Item = u32;

    fn next(&mut self) -> Option<u32> {
        loop {
            let possible_prime = self.next();
            if is_prime(possible_prime) {
                return Some(possible_prime);
            }
        }
    }
}

fn primes() -> Prime {
    Prime {
        number: 2,
        previous: 0,
    }
}

fn is_prime(n: u32) -> bool {
    if n == 2 || n == 3 {
        return true;
    }

    let r = (n as f32).sqrt().floor() as u32;
    (5..=r).step_by(2).all(|x| n % x != 0)
}

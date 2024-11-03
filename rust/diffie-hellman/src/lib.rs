use rand::Rng;

pub fn private_key(p: u64) -> u64 {
    let mut rng = rand::thread_rng();
    rng.gen_range(2..p)
}

pub fn public_key(p: u64, g: u64, a: u64) -> u64 {
    mod_power(p, g, a)
}

pub fn secret(p: u64, b_pub: u64, a: u64) -> u64 {
    mod_power(p, b_pub, a)
}

fn mod_power(b: u64, e: u64, m: u64) -> u64 {
    let mut power = e % b;
    let mut acc = 1;
    let mut m = m;

    while m != 0 {
        if m & 1 == 1 { acc = (acc * power) % b; }
        m /= 2;
        power = (power * power) % b;
    }

    acc
}

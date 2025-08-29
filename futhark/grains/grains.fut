def square(n: i32): u64 = assert (n >= 1 && n <= 64) (1 << u64.i32(n - 1))

def total(): u64 = (1u64 << 64u64) - 1

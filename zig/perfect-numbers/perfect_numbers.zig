pub const Classification = enum {
    deficient,
    perfect,
    abundant,
};

pub fn classify(n: u64) Classification {
    var aliquot_sum: u64 = 0;

    for (1..n) |i| {
        if (i > n / 2) break;
        if (n % i == 0) aliquot_sum += i;
    }

    if (aliquot_sum < n) return .deficient;
    if (aliquot_sum > n) return .abundant;

    return .perfect;
}

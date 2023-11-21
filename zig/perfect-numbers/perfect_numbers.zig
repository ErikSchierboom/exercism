pub const Classification = enum {
    deficient,
    perfect,
    abundant,
};

pub fn classify(n: u64) Classification {
    const aliquot_sum = aliquotSum(n);

    if (aliquot_sum < n) return Classification.deficient;
    if (aliquot_sum > n) return Classification.abundant;

    return Classification.perfect;
}

fn aliquotSum(n: u64) u64 {
    var sum: u64 = 0;
    var i: u64 = 1;

    while (i <= n / 2) : (i += 1) {
        if (n % i == 0) sum += i;
    }

    return sum;
}

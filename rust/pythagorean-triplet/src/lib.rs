use std::collections::HashSet;

pub fn find(sum: u32) -> HashSet<[u32; 3]> {
    (1..=sum/3-1)
        .flat_map(|a| {
            (a+1..=(sum-a)/2)
                .filter_map(move |b| {
                    let c = sum - b - a;
                    if a*a + b*b == c*c {
                        Some([a, b, c])
                    } else {
                        None
                    }
                })
        }
    ).collect()
}

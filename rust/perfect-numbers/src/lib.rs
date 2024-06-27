#[derive(Debug, PartialEq, Eq)]
pub enum Classification {
    Abundant,
    Perfect,
    Deficient,
}

pub fn classify(num: u64) -> Option<Classification> {
    if num == 0 {
        return None;
    }

    match aliquot_sum(num) {
        sum if num > sum => Some(Classification::Deficient),
        sum if num < sum => Some(Classification::Abundant),
        _ => Some(Classification::Perfect),
    }
}

fn aliquot_sum(num: u64) -> u64 {
    (1..=num / 2).filter(|factor| num % factor == 0).sum()
}

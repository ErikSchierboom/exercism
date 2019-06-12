pub fn is_armstrong_number(num: u32) -> bool {
    armstrong_sum(num) == num
}

fn armstrong_sum(num: u32) -> u32 {
    let digits = to_digits(num);
    let length = digits.len() as u32;
    digits.iter().fold(0, |sum, val| sum + val.pow(length))
}

fn to_digits(num: u32) -> Vec<u32> {
    num.to_string()
        .chars()
        .map(|d| d.to_digit(10).unwrap())
        .collect()
}

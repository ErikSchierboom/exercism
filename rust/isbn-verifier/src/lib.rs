/// Determines whether the supplied string is a valid ISBN number
pub fn is_valid_isbn(isbn: &str) -> bool {
    let mut checksum = 0;
    let mut digits = 0;

    for c in isbn.chars() {
        match c {
            '0'..='9' => {
                checksum += c.to_digit(10).unwrap() * (10 - digits);
                digits += 1;
            },
            'X' if digits == 9 => {
                checksum += 10;
                digits += 1;
            },
            '-' => {},
            _ => return false
        }
    }

    digits == 10 && checksum % 11 == 0
}

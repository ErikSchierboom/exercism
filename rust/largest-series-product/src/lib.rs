#[derive(Debug, PartialEq, Eq)]
pub enum Error {
    SpanTooLong,
    InvalidDigit(char),
}

pub fn lsp(string_digits: &str, span: usize) -> Result<u64, Error> {
    if span > string_digits.len() {
        return Err(Error::SpanTooLong);
    }

    to_digits(string_digits)?
        .windows(span)
        .map(|window| window.iter().product())
        .max()
        .ok_or(Error::SpanTooLong)
}

fn to_digits(string_digits: &str) -> Result<Vec<u64>, Error> {
    string_digits
        .chars()
        .map(|c| {
            c.to_digit(10)
                .map(|d| d as u64)
                .ok_or(Error::InvalidDigit(c))
        })
        .collect()
}

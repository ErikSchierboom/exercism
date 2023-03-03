pub fn squareOfSum(number: usize) usize {
    const result = number * (number + 1) / 2;
    return result * result;
}

pub fn sumOfSquares(number: usize) usize {
    return (number * (number + 1) * (2 * number + 1)) / 6;
}

pub fn differenceOfSquares(number: usize) usize {
    return squareOfSum(number) - sumOfSquares(number);
}

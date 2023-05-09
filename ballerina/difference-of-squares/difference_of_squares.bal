public function squareOfSum(int n) returns int {
    var sum = n * (n + 1) / 2;
    return sum * sum;
}

public function sumOfSquares(int n) returns int {
    return n * (n + 1) * (2 * n + 1) / 6;
}

public function differenceOfSquares(int n) returns int {
    return squareOfSum(n) - sumOfSquares(n);
}

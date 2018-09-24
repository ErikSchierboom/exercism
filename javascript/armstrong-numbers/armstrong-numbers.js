export function validate(n) {
  const digits = parseDigits(n);
  return digitsToPower(digits, digits.length) === n;
}

function parseDigits(n) {
  return n
    .toString()
    .split("")
    .map(Number);
}

function digitsToPower(digits, exponent) {
  return digits.reduce((acc, digit) => acc + Math.pow(digit, exponent), 0);
}

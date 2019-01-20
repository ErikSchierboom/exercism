export class Rational {
  constructor(numerator, denominator) {
    this.numerator = numerator;
    this.denominator = denominator;
  }

  add(r) {
    return new Rational(
      this.numerator * r.denominator + r.numerator * this.denominator,
      this.denominator * r.denominator
    ).reduce();
  }

  sub(r) {
    return new Rational(
      this.numerator * r.denominator - r.numerator * this.denominator,
      this.denominator * r.denominator
    ).reduce();
  }

  mul(r) {
    return new Rational(
      this.numerator * r.numerator,
      this.denominator * r.denominator
    ).reduce();
  }

  div(r) {
    return new Rational(
      this.numerator * r.denominator,
      r.numerator * this.denominator
    ).reduce();
  }

  abs() {
    return new Rational(Math.abs(this.numerator), Math.abs(this.denominator));
  }

  reduce() {
    var divisor = this.gcd(
      Math.abs(this.numerator),
      Math.abs(this.denominator)
    );

    if (this.denominator >= 0) {
      return new Rational(this.numerator / divisor, this.denominator / divisor);
    }

    return new Rational(
      (this.numerator * -1) / divisor,
      (this.denominator * -1) / divisor
    );
  }

  exprational(power) {
    return power >= 0
      ? new Rational(
          Math.pow(this.numerator, power),
          Math.pow(this.denominator, power)
        ).reduce()
      : new Rational(
          Math.pow(this.denominator, Math.abs(power)),
          Math.pow(this.numerator, Math.abs(power))
        ).reduce();
  }

  expreal(baseNumber) {
    return this.nthRoot(
      Math.pow(baseNumber, this.numerator),
      this.denominator,
      1e-9
    );
  }

  nthRoot(A, n, p) {
    var x = [];
    x[0] = A;
    x[1] = A / n;
    while (Math.abs(x[0] - x[1]) > p) {
      x[1] = x[0];
      x[0] = (1 / n) * ((n - 1) * x[1] + A / Math.pow(x[1], n - 1));
    }

    return x[0];
  }

  gcd(x, y) {
    return y == 0 ? x : this.gcd(y, x % y);
  }
}

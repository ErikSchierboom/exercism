export default class Rational {
  private numerator: number;
  private denominator: number;

  constructor(numerator: number, denominator: number) {
    this.numerator = numerator;
    this.denominator = denominator;
  }

  public add(r: Rational): Rational {
    return new Rational(
      this.numerator * r.denominator + r.numerator * this.denominator,
      this.denominator * r.denominator
    ).reduce();
  }

  public sub(r: Rational): Rational {
    return new Rational(
      this.numerator * r.denominator - r.numerator * this.denominator,
      this.denominator * r.denominator
    ).reduce();
  }

  public mul(r: Rational): Rational {
    return new Rational(
      this.numerator * r.numerator,
      this.denominator * r.denominator
    ).reduce();
  }

  public div(r: Rational): Rational {
    return new Rational(
      this.numerator * r.denominator,
      r.numerator * this.denominator
    ).reduce();
  }

  public abs(): Rational {
    return new Rational(Math.abs(this.numerator), Math.abs(this.denominator));
  }

  public reduce(): Rational {
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

  public exprational(power: number): Rational {
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

  public expreal(baseNumber: number): number {
    return this.nthRoot(
      Math.pow(baseNumber, this.numerator),
      this.denominator,
      1e-9
    );
  }

  public nthRoot(A: number, n: number, p: number): number {
    var x = [];
    x[0] = A;
    x[1] = A / n;
    while (Math.abs(x[0] - x[1]) > p) {
      x[1] = x[0];
      x[0] = (1 / n) * ((n - 1) * x[1] + A / Math.pow(x[1], n - 1));
    }

    return x[0];
  }

  private gcd(x: number, y: number): number {
    return y == 0 ? x : this.gcd(y, x % y);
  }
}

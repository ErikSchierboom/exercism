export default class Clock {
  private hours: number;
  private minutes: number;

  constructor(hours: number, minutes: number = 0) {
    this.hours = Math.floor(this.mod((hours * 60 + minutes) / 60.0, 24));
    this.minutes = this.mod(minutes, 60);
  }

  plus(minutesToAdd: number): Clock {
    return new Clock(this.hours, this.minutes + minutesToAdd);
  }

  minus(minutesToSubtract: number): Clock {
    return new Clock(this.hours, this.minutes - minutesToSubtract);
  }

  equals(other: Clock): boolean {
    return this.hours === other.hours && this.minutes === other.minutes;
  }

  toString(): string {
    return `${this.formatNumber(this.hours)}:${this.formatNumber(
      this.minutes
    )}`;
  }

  mod(x: number, y: number): number {
    return Math.floor(((x % y) + y) % y);
  }

  formatNumber(x: number): string {
    if (x < 10) return "0" + x;

    return x.toString();
  }
}

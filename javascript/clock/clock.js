class Clock {
    constructor(hours, minutes) {
        this.hours = Math.floor(this.mod((hours * 60 + minutes) / 60.0, 24));
        this.minutes = this.mod(minutes, 60);
    }

    plus(minutesToAdd) {
        return new Clock(this.hours, this.minutes + minutesToAdd);
    }

    minus(minutesToSubtract) {
        return new Clock(this.hours, this.minutes - minutesToSubtract);
    }

    equals(other) {
        return this.hours === other.hours && this.minutes === other.minutes;
    }

    toString() {
        return `${this.formatNumber(this.hours)}:${this.formatNumber(this.minutes)}`;
    }

    mod(x, y) {
        return Math.floor((x % y + y) % y);
    }

    formatNumber(x) {
        if (x < 10)
            return '0' + x;

        return x;
    }
}

export default function at(hours, minutes = 0) {
    return new Clock(hours, minutes);
}
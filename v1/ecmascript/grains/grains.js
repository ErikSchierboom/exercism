import BigInt from './big-integer';

function* range(begin, end) {
    for (let i = begin; i <= end; i++) {
        yield i;
    }
}

export default class Grains {
    squareBigInt(n) {
        return BigInt(2).pow(n - 1);
    }

    square(n) {
        return this.squareBigInt(n).toString();
    }

    total() {
        return [...range(1, 64)]
            .map(x => this.squareBigInt(x))
            .reduce((x, y) => x.add(y))
            .toString();
    }
}
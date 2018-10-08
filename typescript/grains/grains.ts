function* range(begin: number, end: number) {
    for (let i = begin; i <= end; i++) {
        yield i;
    }
}

export default class Grains {
    public static square(n: number) {
        if (n < 1 || n > 64) {
            return -1
        }

        return Math.pow(2, n - 1)
    }

    public static total() {
        return [...range(1, 64)].map(this.square).reduce((x, y) => x + y)
    }
}
function square(x: number) {
    return x * x
}

function sum(numbers: number[]) {
    return numbers.reduce((x, y) => x + y, 0)
}

function* range (begin: number, end: number) {
    for (let i = begin; i <= end; i++) {
        yield i
    }
}

export default class Squares {
    private n: number

    constructor(n: number) {
        this.n = n
    }

    get squareOfSum() {
        return square(sum(this.range))
    }

    get sumOfSquares() {
        return sum(this.range.map(square))
    }

    get difference() {
        return this.squareOfSum - this.sumOfSquares
    }

    private get range() {
        return [...range(1, this.n)]
    }
}
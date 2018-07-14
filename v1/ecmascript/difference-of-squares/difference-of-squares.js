function* range(begin, end) {
    for (let i = begin; i <= end; i++) {
        yield i;
    }
}

function square(x) {
    return x * x;
}

Array.prototype.sum = function() {
    return this.reduce((x, y) => x + y, 0);
}

export default class Squares {
    constructor(n) {
        this.n = n;
    }

    get squareOfSums() {
        return square([...range(1, this.n)].sum());
    }

    get sumOfSquares() {
        return [...range(1, this.n)].map(square).sum();
    }
    
    get difference() {
        return this.squareOfSums - this.sumOfSquares;
    }
}
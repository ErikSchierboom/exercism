class BracketPair {
    constructor(open, close) {
        this._open = open;
        this._close = close;
    }

    get open() {
        return this._open;
    }

    get close() {
        return this._close;
    }
}

const bracketPairs = [
    new BracketPair('[', ']'),
    new BracketPair('(', ')'),
    new BracketPair('{', '}')
];

export default function bracket(input) {
    const brackets = [];

    for (let i = 0; i < input.length; i++) {
        const c = input[i];

        for (const bracketPair of bracketPairs) {
            if (c == bracketPair.open)
                brackets.push(c);
            else if (c == bracketPair.close)
                if (brackets.length === 0 || brackets.pop() !== bracketPair.open)
                    return false;
        }
    }

    return brackets.length === 0;
}
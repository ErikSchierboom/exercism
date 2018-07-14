Array.prototype.equals = function(other) {
    return JSON.stringify(this) === JSON.stringify(other);
}

Array.prototype.chunks = function(size) {
    const chunks = [];

    for (let i = 0; i < this.length; i += size)
        chunks.push(this.slice(i, i + size));

    return chunks;
}

const digitPartPatterns = {
    'S':   [' ', ' ', ' '],
    'B':   [' ', '_', ' '],
    'L':   ['|', ' ', ' '],
    'R':   [' ', ' ', '|'],
    'BL':  ['|', '_', ' '],
    'BR':  [' ', '_', '|'],
    'LR':  ['|', ' ', '|'], 
    'LRB': ['|', '_', '|']
}

const digitRowPatterns = [
    "B LR LRB S",
    "S R R S",
    "B BR BL S",
    "B BR BR S",
    "S LRB R S",
    "B BL BR S",
    "B BL LRB S",
    "B R R S",
    "B LRB LRB S",
    "B LRB BR S"
]

function digitPattern(digit) {
    const x = digitRowPatterns[digit]
        .split(' ')
        const y = x
        .map(p => digitPartPatterns[p]);
        return y;
}

function parseNumber(lines) {
    for (let digit = 0; digit <= 9; digit++) {
        if (lines.equals(digitPattern(digit)))
            return digit.toString();
    }   

    return '?';
}

export default class Ocr {
    convert(input) {
        let rows = this.parseRows(input);
        return rows.map(row => row.map(parseNumber).join('')).join(',');
    }

    parseRows(input) {
        return input
            .split('\n')
            .map(x => [...x])
            .chunks(4)
            .map(row => this.parseRow(row));
    }

    parseRow(row) {
        const digits = [];

        for (let i = 0; i < row[0].length; i+= 3)
            digits.push(this.parseDigit(row, i));

        return digits;
    }

    parseDigit(row, index) {
        const digit = [];

        for (let i = 0; i < 4; i++)
            digit.push(row[i].slice(index, index + 3));

        return digit;
    }
}
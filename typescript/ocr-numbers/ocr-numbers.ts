function chunks<T>(input: T[], size: number): T[][] {
    const chunks = []

    for (let i = 0; i < input.length; i += size) {
        chunks.push(input.slice(i, i + size))
    }

    return chunks
}

const digitPartPatterns: { [description: string]: string[] } = {
    S:   [' ', ' ', ' '],
    B:   [' ', '_', ' '],
    L:   ['|', ' ', ' '],
    R:   [' ', ' ', '|'],
    BL:  ['|', '_', ' '],
    BR:  [' ', '_', '|'],
    LR:  ['|', ' ', '|'],
    LRB: ['|', '_', '|']
}

const digitLinePatterns = [
    ['B',  'LR', 'LRB', 'S'],
    ['S',   'R',   'R', 'S'],
    ['B',  'BR',  'BL', 'S'],
    ['B',  'BR',  'BR', 'S'],
    ['S', 'LRB',   'R', 'S'],
    ['B',  'BL',  'BR', 'S'],
    ['B',  'BL', 'LRB', 'S'],
    ['B',   'R',   'R', 'S'],
    ['B', 'LRB', 'LRB', 'S'],
    ['B', 'LRB',  'BR', 'S']
]

const digitPatterns = digitLinePatterns.map((linePatterns) => linePatterns.map((linePattern) => digitPartPatterns[linePattern].join('')).join(''))

const rowsPerLine = 4
const partsPerRow = 3

export default class OcrParser {
    public static convert(input: string): string {
        return this.lines(input).map((line) => this.lineToDigits(line).join('')).join(',')
    }

    private static lines(input: string): string[][] {
        return chunks(input.split('\n'), rowsPerLine)
    }

    private static lineToDigits(line: string[]): string[] {
        return this.lineToDigitPatterns(line).map((digitPattern) => this.digitPatternToDigit(digitPattern))
    }

    private static lineToDigitPatterns(line: string[]): string[] {
        const digits = []
        const numberOfDigits = line[0].length / partsPerRow

        for (let i = 0; i < numberOfDigits; i += 1) {
            digits.push(this.digitPattern(line, i * partsPerRow))
        }

        return digits
    }

    private static digitPattern(line: string[], index: number): string {
        return line.map((row) => row.slice(index, index + partsPerRow)).join('')
    }

    private static digitPatternToDigit(digitPattern: string): string {
        const digitIndex = digitPatterns.indexOf(digitPattern)
        return digitIndex === -1 ? '?' : digitIndex.toString()
    }
}
export default class Crypto {
    private input: string

    constructor(input: string) {
        this.input = input
    }

    public size(): number {
        return Math.ceil(Math.sqrt(this.normalizePlaintext().length))
    }

    public normalizePlaintext(): string {
        return this.input.toLowerCase().replace(/[^\w]/g, '')
    }

    public normalizeCiphertext(): string {
        return this.transpose(this.plaintextSegments()).join(' ')
    }

    public ciphertext(): string {
        return this.transpose(this.plaintextSegments()).join("")
    }

    public plaintextSegments(): string[] {
        const segments = []
        const plainText = this.normalizePlaintext()
        const segmentSize = this.size()
        const numberOfSegments = Math.ceil(plainText.length / segmentSize)

        for (let i = 0; i < numberOfSegments; i++) {
            segments.push(plainText.substr(i * segmentSize, Math.min(plainText.length - i * segmentSize, segmentSize)))
        }

        return segments
    }

    transpose(input: string[]) {
        const transposed = []

        for (let i = 0; i < input.length; i++) {
            for (let j = 0; j < input[i].length; j++) {
                if (transposed.length <= j) {
                    transposed[j] = ''
                }

                transposed[j] += input[i][j]
            }
        }

        return transposed
    }
}
export default class Crypto {
    constructor(input) {
        this.input = input;
    }

    size() {
        return Math.ceil(Math.sqrt(this.normalizePlaintext().length));
    }

    normalizePlaintext() {
        return this.input.toLowerCase().replace(/[^\w]/g, '');
    }

    normalizeCiphertext() {
        return this.transpose(this.plaintextSegments()).join(' ');
    }

    ciphertext() {
        return this.transpose(this.plaintextSegments()).join("");
    }

    plaintextSegments() {
        const segments = [];
        const plainText = this.normalizePlaintext();
        const segmentSize = this.size();
        const numberOfSegments = Math.ceil(plainText.length / segmentSize);

        for (let i = 0; i < numberOfSegments; i++)
            segments.push(plainText.substr(i * segmentSize, Math.min(plainText.length - i * segmentSize, segmentSize)));

        return segments;
    }

    transpose(input) {
        const transposed = [];

        for (let i = 0; i < input.length; i++) {
            for (let j = 0; j < input[i].length; j++) {
                if (transposed.length <= j)
                    transposed[j] = '';

                transposed[j] += input[i][j];
            }
        }

        return transposed
    }
}
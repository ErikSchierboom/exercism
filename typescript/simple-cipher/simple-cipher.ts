const letters = [..."abcdefghijklmnopqrstuvwxyz"]

function randomLetter() {
    const randomIndex = Math.floor(Math.random() * letters.length)
    return letters[randomIndex]
}

function randomString(length: number) {
    let str = ''

    for (let i = 0; i < length; i++) {
        str += randomLetter()
    }

    return str
}

function mod(x: number, y: number) {
    return Math.floor((x % y + y) % y)
}

export default class Cipher {
    public key: string

    constructor(key?: string) {
        if (key !== undefined && !/^[a-z]+$/.test(key)) {
            throw new Error('Bad key')
        }

        this.key = key || this.generateKey()
    }

    private generateKey() {
        const keyLength = 100
        return randomString(keyLength)
    }

    encode(plainText: string) {
        return this.shift(plainText, (c: number, s: number) => c + s)
    }

    decode(encryptedText: string) {
        return this.shift(encryptedText, (c: number, s: number) => c - s)
    }

    private shift(text: string, applyShift: (c: number, s: number) => number) {
        let shifted = ''

        for (let i = 0; i < text.length; i++) {
            shifted += String.fromCharCode(this.shiftCharacter(text[i], i, applyShift))
        }

        return shifted
    }

    private shiftCharacter(c: string, i: number, applyShift: (c: number, s: number) => number) {
        return 'a'.charCodeAt(0) + this.getCharacterShiftValue(c, i, applyShift)
    }

    private getCharacterShiftValue(c: string, i: number, applyShift: (c: number, s: number) => number) {
        return mod(applyShift(this.normalizeCharacter(c), this.getShiftValue(i)), letters.length)
    }

    private normalizeCharacter(c: string) {
        return c.charCodeAt(0) - 'a'.charCodeAt(0)
    }

    private getShiftValue(i: number) {
        return this.key.charCodeAt(i % this.key.length) % 'a'.charCodeAt(0)
    }
}

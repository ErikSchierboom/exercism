const lowerCaseLetters = 'abcdefghijklmnopqrstuvwxyz'
const upperCaseLetters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'

export default class RotationalCipher {
    static rotate(plaintext: string, rotation: number) {
        return Array.prototype.map.call(plaintext, (letter: string) => this.rotateChar(letter, rotation)).join('')
    }

    static rotateChar(char: string, rotation: number) {
        if (!this.isLetter(char))
            return char;

        const key = char.toLowerCase() === char ? lowerCaseLetters : upperCaseLetters
        return key[(key.indexOf(char) + rotation) % key.length]
    }

    static isLetter(char: string) {
        return char.toLowerCase() !== char.toUpperCase()
    }
}

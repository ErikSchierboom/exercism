export default class Pangram {
    private input: string

    constructor(input: string) {
        this.input = input
    }

    public isPangram(): boolean {
        const letters = [..."abcdefghijklmnopqrstuvwxyz"]
        const lowerCaseInput = this.input.toLowerCase()
        return letters.every((letter) => lowerCaseInput.includes(letter))
    }
}
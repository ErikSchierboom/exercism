export default class Anagram {
    private input: string
    private sortedInput: string

    constructor(input: string) {
        this.input = input.toLowerCase()
        this.sortedInput = this.sortedCharArrayForString(input)
    }

    public matches(...candidates: string[]): string[] {
        return candidates.filter((word) => this.isAnagram(word))
    }

    private isAnagram(word: string): boolean {
        return this.notSameAsInput(word) && this.hasSameLettersAsInput(word)
    }

    private notSameAsInput(word: string): boolean {
        return this.input !== word.toLowerCase()
    }

    private hasSameLettersAsInput(word: string): boolean {
        return this.sortedCharArrayForString(word) === this.sortedInput
    }

    private sortedCharArrayForString(word: string): string {
        return [...word.toLowerCase()].sort().join('')
    }
}
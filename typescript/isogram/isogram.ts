export default class Isogram {
    public static isIsogram(input: string): boolean {
        const chars = [...input.toLowerCase()]
        const counts: { [c: string]: boolean } = {}

        for (const char of chars) {
            if (!this.isLetter(char)) {
                continue
            }

            if (counts[char] !== undefined) {
                return false
            }

            counts[char] = true
        }

        return true
    }

    private static isLetter(char: string): boolean {
        return char.toUpperCase() !== char.toLowerCase()
    }
}
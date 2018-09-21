export default class BracketPush {
    private readonly input: string
    private readonly openingBrackets: Set<string>
    private readonly closingBrackets: Set<string>
    private readonly closingToOpeningBrackets: Map<string, string>

    constructor(input: string) {
        this.input = input
        this.openingBrackets = new Set(['{', '[', '('])
        this.closingBrackets = new Set(['}', ']', ')'])
        this.closingToOpeningBrackets = new Map(Object.entries({ '}': '{', ']': '[', ')': '(' }))
    }

    isPaired() {
        const unpairedOpeningBrackets = []

        for (const character of [...this.input]) {
            if (this.openingBrackets.has(character)) {
                unpairedOpeningBrackets.push(character)
            } else if (this.closingBrackets.has(character)) {
                const expectedOpeningBracket = this.closingToOpeningBrackets.get(character)
                const actualOpeningBracket = unpairedOpeningBrackets.length > 0 ? unpairedOpeningBrackets[unpairedOpeningBrackets.length - 1] : undefined

                if (expectedOpeningBracket === actualOpeningBracket) {
                    unpairedOpeningBrackets.splice(unpairedOpeningBrackets.length - 1, 1)
                } else {
                    return false
                }
            }
        }

        return unpairedOpeningBrackets.length === 0
    }
}

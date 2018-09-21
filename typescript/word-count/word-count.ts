export default class Words {
    count(input: String) {
        return this.words(input).reduce(this.updateWordCount, new Map<string, number>())
    }

    words(input: String) {
        return input.trim().toLowerCase().split(/\s+/)
    }

    updateWordCount(count: Map<string, number>, word: string) {
        const currentWordCount = count.get(word) || 0
        count.set(word, currentWordCount + 1)
        return count
    }
}
export default class RunLengthEncoding {
    static encode(plainText: string) {
        return Array.from(this.encodeBlocks(plainText), this.encodeBlock).join("")
    }

    private static * encodeBlocks(plainText: string) {
        if (plainText.length === 0) {
            return
        }

        let currentCharacter
        let currentCharacterCount = 0

        for (let i = 0; i < plainText.length; i++) {
            if (i === 0) {
                currentCharacter = plainText[i]
                currentCharacterCount = 1
            } else if (currentCharacter === plainText[i]) {
                currentCharacterCount++
            } else {
                yield [currentCharacter, currentCharacterCount]
                currentCharacter = plainText[i]
                currentCharacterCount = 1
            }
        }

        yield [currentCharacter, currentCharacterCount]
    }

    private static encodeBlock(characterWithCount: [string, number]) {
        return characterWithCount[1] === 1 ? characterWithCount[0] : `${characterWithCount[1]}${characterWithCount[0]}`
    }

    static decode(encodedText: string) {
        return Array.from(this.decodeBlocks(encodedText), this.decodeBlock).join("")
    }

    private static * decodeBlocks(encodedText: string) {
        if (encodedText.length === 0) {
            return
        }

        let currentCharacter
        let currentCharacterCount = 0

        for (currentCharacter of encodedText) {
            const digit = parseInt(currentCharacter, 10)

            if (isNaN(digit)) {
                yield [currentCharacter, currentCharacterCount === 0 ? 1 : currentCharacterCount]
                currentCharacterCount = 0
            } else {
                currentCharacterCount = currentCharacterCount * 10 + digit
            }
        }

        yield [currentCharacter, currentCharacterCount]
    }

    private static decodeBlock(characterWithCount: [string, number]) {
        return characterWithCount[0].repeat(characterWithCount[1])
    }
}
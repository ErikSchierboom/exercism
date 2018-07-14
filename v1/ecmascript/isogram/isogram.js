export default class Isogram {
    constructor(input) {
        this.chars = [...input.toLowerCase()];
    }

    isIsogram() {
        const counts = {};

        for (const char of this.chars) {
            if (!this.isLetter(char))
                continue;

            if (counts[char] !== undefined)
                return false;

            counts[char] = true;
        }

        return true;
    }

    isLetter(char) {
        return char.toUpperCase() != char.toLowerCase();
    }
}
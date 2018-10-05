export default class TwelveDays {
    static recite(begin: number, end: number): string {
        const verses = []

        for (let verseIndex = begin; verseIndex <= end; verseIndex += 1) {
            verses.push(this.verse(verseIndex))
        }

        return verses.join('')
    }

    public static verse(index: number): string {
        return `On the ${this.ordinal(index)} day of Christmas my true love gave to me, ${this.subjects(index)}.\n`
    }

    private static cardinal(value: number, verse: number): string {
        switch (value) {
            case 1: return verse === 1 ? "a" : "and a"
            case 2: return "two"
            case 3: return "three"
            case 4: return "four"
            case 5: return "five"
            case 6: return "six"
            case 7: return "seven"
            case 8: return "eight"
            case 9: return "nine"
            case 10: return "ten"
            case 11: return "eleven"
            case 12: return "twelve"
            default: throw new Error("Unknown cardinal")
        }
    }

    private static ordinal(value: number): string {
        switch (value) {
            case 1: return "first"
            case 2: return "second"
            case 3: return "third"
            case 4: return "fourth"
            case 5: return "fifth"
            case 6: return "sixth"
            case 7: return "seventh"
            case 8: return "eighth"
            case 9: return "ninth"
            case 10: return "tenth"
            case 11: return "eleventh"
            case 12: return "twelfth"
            default: throw new Error("Unknown ordinal")
        }
    }

    private static subject(value: number): string {
        switch (value) {
            case 1: return "Partridge in a Pear Tree"
            case 2: return "Turtle Doves"
            case 3: return "French Hens"
            case 4: return "Calling Birds"
            case 5: return "Gold Rings"
            case 6: return "Geese-a-Laying"
            case 7: return "Swans-a-Swimming"
            case 8: return "Maids-a-Milking"
            case 9: return "Ladies Dancing"
            case 10: return "Lords-a-Leaping"
            case 11: return "Pipers Piping"
            case 12: return "Drummers Drumming"
            default: throw new Error("Unknown subject")
        }
    }

    private static subjects(verse: number): string {
        const subjects = []

        for (let i = 1; i <= verse; i += 1) {
            subjects.push(this.indexedSubject(verse - i + 1, verse))
        }

        return subjects.join(', ')
    }

    private static indexedSubject(index: number, verse: number): string {
        return `${this.cardinal(index, verse)} ${this.subject(index)}`
    }
}

function* range(begin: number, end: number) {
    for (let i = begin; i <= end; i++) {
        yield i
    }
}

const subjects = [
    "spider",
    "bird",
    "cat",
    "dog",
    "goat",
    "cow"
]

const followUps = [
    "It wriggled and jiggled and tickled inside her.",
    "How absurd to swallow a bird!",
    "Imagine that, to swallow a cat!",
    "What a hog, to swallow a dog!",
    "Just opened her throat and swallowed a goat!",
    "I don't know how she swallowed a cow!"
]

const history = [
    "I don't know how she swallowed a cow!",
    "She swallowed the cow to catch the goat.",
    "She swallowed the goat to catch the dog.",
    "She swallowed the dog to catch the cat.",
    "She swallowed the cat to catch the bird.",
    "She swallowed the bird to catch the spider that wriggled and jiggled and tickled inside her.",
    "She swallowed the spider to catch the fly.",
    "I don't know why she swallowed the fly. Perhaps she'll die."
]

export default class Song {
    public static verse(verseNumber: number) {
        return `${this.verseBegin(verseNumber)}\n${this.verseEnd(verseNumber)}\n`
    }

    public static verses(begin: number, end: number) {
        const verses = [...range(begin, end)].map((verseNumber) => this.verse(verseNumber))
        return verses.join("\n")
    }

    private static verseBegin(verseNumber: number) {
        if (verseNumber === 1) {
            return "I know an old lady who swallowed a fly."
        }

        if (verseNumber === 8) {
            return "I know an old lady who swallowed a horse."
        }

        const subject = subjects[verseNumber - 2]
        const followUp = followUps[verseNumber - 2]
        return `I know an old lady who swallowed a ${subject}.\n${followUp}`
    }

    private static verseEnd(verseNumber: number) {
        if (verseNumber === 8) {
            return "She's dead, of course!"
        }

        return history.slice(history.length - verseNumber, history.length - verseNumber + verseNumber).join("\n")
    }
}
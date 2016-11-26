function* range(begin, end) {
    for (let i = begin; i <= end; i++) {
        yield i;
    }
}

export default class Song {
    
    constructor() {
        this.numberOfVerses = 8;

        this.subjects = [
            "spider",
            "bird",
            "cat",
            "dog",
            "goat",
            "cow"
        ];

        this.followUps = [
            "It wriggled and jiggled and tickled inside her.",
            "How absurd to swallow a bird!",
            "Imagine that, to swallow a cat!",
            "What a hog, to swallow a dog!",
            "Just opened her throat and swallowed a goat!",
            "I don't know how she swallowed a cow!"
        ];

        this.history = [
            "I don't know how she swallowed a cow!",
            "She swallowed the cow to catch the goat.",
            "She swallowed the goat to catch the dog.",
            "She swallowed the dog to catch the cat.",
            "She swallowed the cat to catch the bird.",
            "She swallowed the bird to catch the spider that wriggled and jiggled and tickled inside her.",
            "She swallowed the spider to catch the fly.",
            "I don't know why she swallowed the fly. Perhaps she'll die."
        ];
    }
    
    verseBegin(number) {
        if (number == 1) {
            return "I know an old lady who swallowed a fly.";
        }

        if (number == 8) {
            return "I know an old lady who swallowed a horse.";
        }

        const subject = this.subjects[number - 2];
        const followUp = this.followUps[number - 2];
        return `I know an old lady who swallowed a ${subject}.\n${followUp}`;
    }

    verseEnd(number) {
        if (number == 8) {
            return "She's dead, of course!";
        }

        return this.history.slice(this.history.length - number, this.history.length - number + number).join("\n");
    }    
    
    verse(number) {
        return `${this.verseBegin(number)}\n${this.verseEnd(number)}\n`;
    }

    verses(begin, end) {
        const verses = [...range(begin, end)].map(number => this.verse(number) + "\n");
        return verses.join("");
    }
}

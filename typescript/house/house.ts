const subjects =
    [
        'house that Jack built',
        'malt',
        'rat',
        'cat',
        'dog',
        'cow with the crumpled horn',
        'maiden all forlorn',
        'man all tattered and torn',
        'priest all shaven and shorn',
        'rooster that crowed in the morn',
        'farmer sowing his corn',
        'horse and the hound and the horn',
    ]

const verbs =
    [
        'lay in',
        'ate',
        'killed',
        'worried',
        'tossed',
        'milked',
        'kissed',
        'married',
        'woke',
        'kept',
        'belonged to',
        '',
    ]

export default class House {
    public static verses(startVerse: number, endVerse: number) {
        const lines = []

        for (let verse = startVerse; verse <= endVerse; verse += 1) {
            lines.push(...this.verse(verse))

            if (verse < endVerse) {
                lines.push('')
            }
        }

        return lines
    }

    public static verse(verseNumber: number) {
        const lines = []

        for (let i = verseNumber; i >= 1; i -= 1) {
            lines.push(this.line(verseNumber, i))
        }

        return lines
    }

    private static line(verseNumber: number, index: number) {
        const subject = subjects[index - 1]
        const verb = verbs[index - 1]
        const ending = index === 1 ? '.' : ''

        return index === verseNumber
            ? `This is the ${subject}${ending}`
            : `that ${verb} the ${subject}${ending}`
    }
}

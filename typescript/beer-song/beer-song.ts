function* range(begin: number, end: number) {
    for (let i = begin; i <= end; i++) {
        yield i
    }
}

export default class BeerSong {
    public static verse(verseNumber: number) {
        switch (verseNumber) {
            case 0:
                return "No more bottles of beer on the wall, no more bottles of beer.\nGo to the store and buy some more, 99 bottles of beer on the wall.\n"
            case 1:
                return "1 bottle of beer on the wall, 1 bottle of beer.\nTake it down and pass it around, no more bottles of beer on the wall.\n"
            case 2:
                return "2 bottles of beer on the wall, 2 bottles of beer.\nTake one down and pass it around, 1 bottle of beer on the wall.\n"
            default:
                return `${verseNumber} bottles of beer on the wall, ${verseNumber} bottles of beer.\nTake one down and pass it around, ${verseNumber - 1} bottles of beer on the wall.\n`
        }
    }

    public static sing(start = 99, stop = 0) {
        const verses = Array.from(range(stop, start), BeerSong.verse).reverse()
        return verses.join("\n")
    }
}
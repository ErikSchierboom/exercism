String.prototype.padRight = function(size) {
    let padded = this;

    for (let i = this.length; i < size; i++)
        padded += ' ';

    return padded;
}

export default class Diamond {
    makeDiamond(letter) {
        var letters = this.getLetters(letter);
        var diamondLetters = letters.concat(letters.slice(0).reverse().slice(1));

        return diamondLetters.map(diamondLetter => this.makeLine(letters.length, diamondLetter)).join("\n") + "\n";
    }

    getLetters(letter) {
        const letters = [];

        const start = 'A'.charCodeAt();
        const stop = letter.charCodeAt();

        for (let i = start; i <= stop; i++) 
            letters.push({ row: i - start, letter: String.fromCharCode(i)});

        return letters;
    }

    makeLine(letterCount, { row: row, letter: letter }) {
        var outerSpaces = "".padRight(letterCount - row - 1);
        var innerSpaces = "".padRight(row === 0 ? 0 : row * 2 - 1);

        return letter === 
            'A' ? `${outerSpaces}${letter}${outerSpaces}`
                : `${outerSpaces}${letter}${innerSpaces}${letter}${outerSpaces}`;
    }
}
const alphabet = Array.from("ABCDEFGHIJKLMNOPQRSTUVWXYZ");

type LetterWithRow = [string, number];

export default class Diamond {
  public makeDiamond(letter: string): string {
    const letters = this.getLetters(letter);
    const diamondLetters = letters.concat(
      Array.from(letters)
        .reverse()
        .slice(1)
    );

    return diamondLetters
      .map(indexedLetter => this.makeLine(indexedLetter, letters.length))
      .join("");
  }

  private getLetters(diamondLetter: string): LetterWithRow[] {
    const letters = alphabet.slice(0, alphabet.indexOf(diamondLetter) + 1);
    return letters.map<LetterWithRow>((letter, row) => [letter, row]);
  }

  private makeLine(indexedLetter: LetterWithRow, letterCount: number) {
    const [letter, row] = indexedLetter;
    const outerSpaces = "".padEnd(letterCount - row - 1);
    const innerSpaces = "".padEnd(row == 0 ? 0 : row * 2 - 1);

    return letter == "A"
      ? `${outerSpaces}${letter}${outerSpaces}\n`
      : `${outerSpaces}${letter}${innerSpaces}${letter}${outerSpaces}\n`;
  }
}

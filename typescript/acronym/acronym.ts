export default class Acronyms {
  static parse(phrase: string) {
    return this.words(phrase)
      .map(this.acronymLetter)
      .join('')
  }

  private static words(phrase: string): string[] {
    const words = phrase.match(/[A-Z]+[a-z]*|[a-z]+/g)
    return words === null ? [] : words
  }

  private static acronymLetter(word: string) {
    return word[0].toUpperCase()
  }
}
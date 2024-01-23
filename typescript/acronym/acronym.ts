export function parse(phrase: string) {
  return words(phrase).map(acronymLetter).join("");
}

function words(phrase: string): string[] {
  return phrase.match(/[A-Z]+[a-z]*|[a-z]+/g) || [];
}

function acronymLetter(word: string) {
  return word[0].toUpperCase();
}

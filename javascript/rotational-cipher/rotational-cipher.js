const lowerCaseLetters = "abcdefghijklmnopqrstuvwxyz";
const upperCaseLetters = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";

export default class RotationalCipher {
  static rotate(plaintext, rotation) {
    return Array.prototype.map
      .call(plaintext, letter => this.rotateChar(letter, rotation))
      .join("");
  }

  static rotateChar(char, rotation) {
    if (!this.isLetter(char)) return char;

    const key =
      char.toLowerCase() === char ? lowerCaseLetters : upperCaseLetters;
    return key[(key.indexOf(char) + rotation) % key.length];
  }

  static isLetter(char) {
    return char.toLowerCase() !== char.toUpperCase();
  }
}

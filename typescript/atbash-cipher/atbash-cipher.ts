const blockSize = 5;
const plain = "abcdefghijklmnopqrstuvwxyz0123456789";
const cipher = "zyxwvutsrqponmlkjihgfedcba0123456789";

export default class AtbashCipher {
  public encode(input: string) {
    return this.encodeInBlocks(this.getEncodedCharacters(input)).join(" ");
  }

  private getEncodedCharacters(words: string) {
    return Array.from(this.getValidCharacters(words), this.encodeCharacter);
  }

  private getValidCharacters(words: string): string {
    return words.toLowerCase().replace(/[^\w]/g, "");
  }

  private encodeCharacter(character: string): string {
    return cipher[plain.indexOf(character)];
  }

  private encodeInBlocks(value: string[]): string[] {
    const blocks = [];

    for (let i = 0; i < value.length; i += blockSize)
      blocks.push(value.slice(i, i + blockSize).join(""));

    return blocks;
  }

  public decode(value: string): string {
    return Array.from(value.replace(" ", ""), this.decodeCharacter).join("");
  }

  private decodeCharacter(character: string): string {
    return plain[cipher.indexOf(character)];
  }
}

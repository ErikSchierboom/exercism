export default class NucleotideCounts {
  static parse(strand) {
    const counts = new Map([['A', 0], ['C', 0], ['G', 0], ['T', 0]]);

    for (const character of strand) {
      const characterCount = counts.get(character);
      if (characterCount === undefined) {
        throw new Error('Invalid nucleotide in strand');
      }

      counts.set(character, characterCount + 1);
    }

    return Array.from(counts.values()).join(' ');
  }
}

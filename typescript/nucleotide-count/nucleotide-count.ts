export default class NucleotideCount {
  static nucleotideCounts(strand: string): { [letter: string]: number } {
    const counts: { [letter: string]: number } = {
      A: 0,
      C: 0,
      G: 0,
      T: 0
    }

    for (const character of strand) {
      const characterCount = counts[character]
      if (characterCount === undefined) {
        throw new Error('Invalid nucleotide in strand')
      }

      counts[character] = characterCount + 1
    }

    return counts
  }
}

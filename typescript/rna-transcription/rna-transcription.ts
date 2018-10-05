export default class Transcriptor {
  toRna(dna: string): string {
    return Array.from(dna, this.dnaToRna).join('')
  }

  private dnaToRna(nucleotide: string): string {
    switch (nucleotide) {
      case 'G': return 'C'
      case 'C': return 'G'
      case 'T': return 'A'
      case 'A': return 'U'
      default: throw new Error('Invalid input DNA.')
    }
  }
}
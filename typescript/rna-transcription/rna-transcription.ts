export default class Transcriptor {
    toRna(dna: string) {
        return Array.prototype.map.call(dna, this.dnaToRna).join('')
    }

    private dnaToRna(nucleotide: string) {
        switch (nucleotide) {
            case 'G': return 'C'
            case 'C': return 'G'
            case 'T': return 'A'
            case 'A': return 'U'
            default: throw 'Invalid input DNA.'
        }
    }
}
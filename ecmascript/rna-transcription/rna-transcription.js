export default class Transcriptor {
    toRna(dna) {
        return Array.prototype.map.call(dna, this.dnaToRna).join('');
    }

    dnaToRna(nucleotide) {
        switch (nucleotide) {
            case 'G': return 'C';
            case 'C': return 'G';
            case 'T': return 'A';
            case 'A': return 'U';
        }
    }
}
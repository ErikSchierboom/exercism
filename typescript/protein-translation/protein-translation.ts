export default class ProteinTranslation {
    static proteins(rnaSequence: string) {
        const proteins = []

        for (let i = 0; i < rnaSequence.length / 3; i++) {
            const protein = this.codonToProtein(rnaSequence.substr(3 * i, 3))

            if (protein === "STOP") {
                break
            }

            proteins.push(protein)
        }

        return proteins
    }

    private static codonToProtein(codon: string) {
        switch (codon) {
            case "AUG": return "Methionine"
            case "UUU":
            case "UUC": return "Phenylalanine"
            case "UUA":
            case "UUG": return "Leucine"
            case "UCU":
            case "UCC":
            case "UCA":
            case "UCG": return "Serine"
            case "UAU":
            case "UAC": return "Tyrosine"
            case "UGU":
            case "UGC": return "Cysteine"
            case "UGG": return "Tryptophan"
            case "UAA":
            case "UAG":
            case "UGA":
                return "STOP"
            default:
                throw new Error('Invalid codon')
        }
    }
}

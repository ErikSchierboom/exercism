export default class Hamming {
    compute(strand1: string, strand2: string): number {
        if (strand1.length !== strand2.length) {
            throw new Error('DNA strands must be of equal length.')
        }

        let difference = 0

        for (let i = 0; i < strand1.length; i += 1) {
            difference += strand1[i] === strand2[i] ? 0 : 1
        }

        return difference
    }
}
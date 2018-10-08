import PerfectNumbers from './perfect-numbers'

describe('Perfect numbers', () => {
    it('Smallest perfect number is classified correctly', () => {
        const expected = 'perfect'
        expect(PerfectNumbers.classify(6)).toEqual(expected)
    })

    it('Smallest perfect number is classified correctly', () => {
        const expected = 'perfect'
        expect(PerfectNumbers.classify(28)).toEqual(expected)
    })

    it('Smallest perfect number is classified correctly', () => {
        const expected = 'perfect'
        expect(PerfectNumbers.classify(33550336)).toEqual(expected)
    })
})

describe('Abundant numbers', () => {
    it('Smallest abundant number is classified correctly', () => {
        const expected = 'abundant'
        expect(PerfectNumbers.classify(12)).toEqual(expected)
    })

    it('Medium abundant number is classified correctly', () => {
        const expected = 'abundant'
        expect(PerfectNumbers.classify(30)).toEqual(expected)
    })

    it('Large abundant number is classified correctly', () => {
        const expected = 'abundant'
        expect(PerfectNumbers.classify(33550335)).toEqual(expected)
    })
})

describe('Deficient numbers', () => {
    it('Smallest prime deficient number is classified correctly', () => {
        const expected = 'deficient'
        expect(PerfectNumbers.classify(2)).toEqual(expected)
    })

    it('Smallest non-prime deficient number is classified correctly', () => {
        const expected = 'deficient'
        expect(PerfectNumbers.classify(4)).toEqual(expected)
    })

    it('Medium deficient number is classified correctly', () => {
        const expected = 'deficient'
        expect(PerfectNumbers.classify(32)).toEqual(expected)
    })

    it('Large deficient number is classified correctly', () => {
        const expected = 'deficient'
        expect(PerfectNumbers.classify(33550337)).toEqual(expected)
    })

    it('Edge case (no factors other than itself) is classified correctly', () => {
        const expected = 'deficient'
        expect(PerfectNumbers.classify(1)).toEqual(expected)
    })
})

describe('Invalid inputs', () => {
    it('Zero is rejected (not a natural number', () => {
        expect(() => { PerfectNumbers.classify(0) }).toThrowError('Classification is only possible for natural numbers.')
    })

    it('Negative integer is rejected (not a natural number', () => {
        expect(() => { PerfectNumbers.classify(-1) }).toThrowError('Classification is only possible for natural numbers.')
    })
})

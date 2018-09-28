import CollatzConjecture from './collatz-conjecture'

describe('CollatzConjecture', () => {
    it('zero steps for one', () => {
        const expected = 0
        expect(CollatzConjecture.steps(1)).toBe(expected)
    })

    it('divide if even', () => {
        const expected = 4
        expect(CollatzConjecture.steps(16)).toBe(expected)
    })

    it('even and odd steps', () => {
        const expected = 9
        expect(CollatzConjecture.steps(12)).toBe(expected)
    })

    it('Large number of even and odd steps', () => {
        const expected = 152
        expect(CollatzConjecture.steps(1000000)).toBe(expected)
    })

    it('zero is an error', () => {
        const expected = 'Only positive numbers are allowed'
        expect(() => {CollatzConjecture.steps(0)}).toThrowError(expected)
    })

    it('negative value is an error', () => {
        const expected = 'Only positive numbers are allowed'
        expect(() => {CollatzConjecture.steps(-15)}).toThrowError(expected)
    })
})
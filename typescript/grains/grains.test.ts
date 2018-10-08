import Grains from './grains'

describe('returns the number of grains on the square', () => {
    it('1', () => {
        const expected = 1
        expect(Grains.square(1)).toEqual(expected)
    })

    it('2', () => {
        const expected = 2
        expect(Grains.square(2)).toEqual(expected)
    })

    it('3', () => {
        const expected = 4
        expect(Grains.square(3)).toEqual(expected)
    })

    it('4', () => {
        const expected = 8
        expect(Grains.square(4)).toEqual(expected)
    })

    it('16', () => {
        const expected = 32768
        expect(Grains.square(16)).toEqual(expected)
    })

    it('32', () => {
        const expected = 2147483648
        expect(Grains.square(32)).toEqual(expected)
    })

    it('64', () => {
        const expected = 9223372036854775808
        expect(Grains.square(64)).toEqual(expected)
    })

    it('square 0 raises an exception', () => {
        const expected = -1
        expect(Grains.square(0)).toEqual(expected)
    })

    it('negative square raises an exception', () => {
        const expected = -1
        expect(Grains.square(-1)).toEqual(expected)
    })

    it('square greater than 64 raises an exception', () => {
        const expected = -1
        expect(Grains.square(65)).toEqual(expected)
    })
})

describe('returns the total number of grains on the board', () => {
    it('total', () => {
        const expected = 18446744073709551615
        expect(Grains.total()).toEqual(expected)
    })
})

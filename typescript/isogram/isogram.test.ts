import Isogram from './isogram'

describe('Check if the given string is an isogram', () => {
    it('empty string', () => {
        const expected = true
        expect(Isogram.isIsogram('')).toEqual(expected)
    })

    it('isogram with only lower case characters', () => {
        const expected = true
        expect(Isogram.isIsogram('isogram')).toEqual(expected)
    })

    it('word with one duplicated character', () => {
        const expected = false
        expect(Isogram.isIsogram('eleven')).toEqual(expected)
    })

    it('longest reported english isogram', () => {
        const expected = true
        expect(Isogram.isIsogram('subdermatoglyphic')).toEqual(expected)
    })

    it('word with duplicated character in mixed case', () => {
        const expected = false
        expect(Isogram.isIsogram('Alphabet')).toEqual(expected)
    })

    it('hypothetical isogrammic word with hyphen', () => {
        const expected = true
        expect(Isogram.isIsogram('thumbscrew-japingly')).toEqual(expected)
    })

    it('isogram with duplicated hyphen', () => {
        const expected = true
        expect(Isogram.isIsogram('six-year-old')).toEqual(expected)
    })

    it('made-up name that is an isogram', () => {
        const expected = true
        expect(Isogram.isIsogram('Emily Jung Schwartzkopf')).toEqual(expected)
    })

    it('duplicated character in the middle', () => {
        const expected = false
        expect(Isogram.isIsogram('accentor')).toEqual(expected)
    })
})

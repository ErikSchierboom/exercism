import Luhn from './luhn'

describe('Luhn', () => {
    it('single digit strings can not be valid', () => {
        expect(Luhn.valid('1')).toBeFalsy()
    })

    it('a single zero is invalid', () => {
        expect(Luhn.valid('0')).toBeFalsy()
    })

    it('a simple valid SIN that remains valid if reversed', () => {
        expect(Luhn.valid('059')).toBeTruthy()
    })

    it('a valid Canadian SIN', () => {
        expect(Luhn.valid('055 444 285')).toBeTruthy()
    })

    it('invalid Canadian SIN', () => {
        expect(Luhn.valid('055 444 286')).toBeFalsy()
    })

    it('invalid credit card', () => {
        expect(Luhn.valid('8273 1232 7352 0569')).toBeFalsy()
    })

    it('valid strings with a non-digit included become invalid', () => {
        expect(Luhn.valid('055a 444 285')).toBeFalsy()
    })

    it('valid strings with punctuation included become invalid', () => {
        expect(Luhn.valid('055-444-285')).toBeFalsy()
    })

    it('valid strings with symbols included become invalid', () => {
        expect(Luhn.valid('055£ 444$ 285')).toBeFalsy()
    })

    it('single zero with space is invalid', () => {
        expect(Luhn.valid(' 0')).toBeFalsy()
    })

    it('input digit 9 is correctly converted to output digit 9', () => {
        expect(Luhn.valid('091')).toBeTruthy()
    })
})

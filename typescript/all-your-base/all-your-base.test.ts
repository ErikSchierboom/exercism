import Converter from './all-your-base'

const converter = new Converter()

describe('Converter', () => {
    it('single bit one to decimal', () => {
        expect(converter.convert([1], 2, 10)).toEqual([1])
    })

    it('binary to single decimal', () => {
        expect(converter.convert([1, 0, 1], 2, 10)).toEqual([5])
    })

    it('single decimal to binary', () => {
        expect(converter.convert([5], 10, 2)).toEqual([1, 0, 1])
    })

    it('binary to multiple decimal', () => {
        expect(converter.convert([1, 0, 1, 0, 1, 0], 2, 10)).toEqual([4, 2])
    })

    it('decimal to binary', () => {
        expect(converter.convert([4, 2], 10, 2)).toEqual([1, 0, 1, 0, 1, 0])
    })

    it('trinary to hexadecimal', () => {
        expect(converter.convert([1, 1, 2, 0], 3, 16)).toEqual([2, 10])
    })

    it('hexadecimal to trinary', () => {
        expect(converter.convert([2, 10], 16, 3)).toEqual([1, 1, 2, 0])
    })

    it('15-bit integer', () => {
        expect(converter.convert([3, 46, 60], 97, 73)).toEqual([6, 10, 45])
    })

    it('empty list', () => {
        expect(() => {
            converter.convert([], 2, 10)
        }).toThrowError('Input has wrong format')
    })

    it('single zero', () => {
        expect(converter.convert([0], 10, 2)).toEqual([0])
    })

    it('multiple zeros', () => {
        expect(() => {
            converter.convert([0, 0, 0], 10, 2)
        }).toThrowError('Input has wrong format')
    })

    it('leading zeros', () => {
        expect(() => {
            converter.convert([0, 6, 0], 7, 10)
        }).toThrowError('Input has wrong format')
    })

    it('negative digit', () => {
        expect(() => {
            converter.convert([1, -1, 1, 0, 1, 0], 2, 10)
        }).toThrowError('Input has wrong format')
    })

    it('invalid positive digit', () => {
        expect(() => {
            converter.convert([1, 2, 1, 0, 1, 0], 2, 10)
        }).toThrowError('Input has wrong format')
    })

    it('first base is one', () => {
        expect(() => {
            converter.convert([], 1, 10)
        }).toThrowError('Wrong input base')
    })

    it('second base is one', () => {
        expect(() => {
            converter.convert([1, 0, 1, 0, 1, 0], 2, 1)
        }).toThrowError('Wrong output base')
    })

    it('first base is zero', () => {
        expect(() => {
            converter.convert([], 0, 10)
        }).toThrowError('Wrong input base')
    })

    it('second base is zero', () => {
        expect(() => {
            converter.convert([7], 10, 0)
        }).toThrowError('Wrong output base')
    })

    it('first base is negative', () => {
        expect(() => {
            converter.convert([1], -2, 10)
        }).toThrowError('Wrong input base')
    })

    it('second base is negative', () => {
        expect(() => {
            converter.convert([1], 2, -7)
        }).toThrowError('Wrong output base')
    })

    it('both bases are negative', () => {
        expect(() => {
            converter.convert([1], -2, -7)
        }).toThrowError('Wrong input base')
    })

    it('wrong output_base base not integer', () => {
        expect(() => {
            converter.convert([0], 3, 2.5)
        }).toThrowError('Wrong output base')
    })
})

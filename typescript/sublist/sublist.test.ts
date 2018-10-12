import List from './sublist'

describe('Sublist', () => {
    it('empty lists', () => {
        const listOne = new List()
        const listTwo = new List()
        const expected = 'equal'

        expect(listOne.compare(listTwo)).toEqual(expected)
    })

    it('empty list within non empty list', () => {
        const listOne = new List()
        const listTwo = new List(1, 2, 3)
        const expected = 'sublist'

        expect(listOne.compare(listTwo)).toEqual(expected)
    })

    it('non empty list contains empty list', () => {
        const listOne = new List(1, 2, 3)
        const listTwo = new List()
        const expected = 'superlist'

        expect(listOne.compare(listTwo)).toEqual(expected)
    })

    it('list equals itself', () => {
        const listOne = new List(1, 2, 3)
        const listTwo = new List(1, 2, 3)
        const expected = 'equal'

        expect(listOne.compare(listTwo)).toEqual(expected)
    })

    it('different lists', () => {
        const listOne = new List(1, 2, 3)
        const listTwo = new List(2, 3, 4)
        const expected = 'unequal'

        expect(listOne.compare(listTwo)).toEqual(expected)
    })

    it('false start', () => {
        const listOne = new List(1, 2, 5)
        const listTwo = new List(0, 1, 2, 3, 1, 2, 5, 6)
        const expected = 'sublist'

        expect(listOne.compare(listTwo)).toEqual(expected)
    })

    it('consecutive', () => {
        const listOne = new List(1, 1, 2)
        const listTwo = new List(0, 1, 1, 1, 2, 1, 2)
        const expected = 'sublist'

        expect(listOne.compare(listTwo)).toEqual(expected)
    })

    it('sublist at start', () => {
        const listOne = new List(0, 1, 2)
        const listTwo = new List(0, 1, 2, 3, 4, 5)
        const expected = 'sublist'

        expect(listOne.compare(listTwo)).toEqual(expected)
    })

    it('sublist in middle', () => {
        const listOne = new List(2, 3, 4)
        const listTwo = new List(0, 1, 2, 3, 4, 5)
        const expected = 'sublist'

        expect(listOne.compare(listTwo)).toEqual(expected)
    })

    it('sublist at end', () => {
        const listOne = new List(3, 4, 5)
        const listTwo = new List(0, 1, 2, 3, 4, 5)
        const expected = 'sublist'

        expect(listOne.compare(listTwo)).toEqual(expected)
    })

    it('at start of superlist', () => {
        const listOne = new List(0, 1, 2, 3, 4, 5)
        const listTwo = new List(0, 1, 2)
        const expected = 'superlist'

        expect(listOne.compare(listTwo)).toEqual(expected)
    })

    it('in middle of superlist', () => {
        const listOne = new List(0, 1, 2, 3, 4, 5)
        const listTwo = new List(2, 3)
        const expected = 'superlist'

        expect(listOne.compare(listTwo)).toEqual(expected)
    })

    it('at end of superlist', () => {
        const listOne = new List(0, 1, 2, 3, 4, 5)
        const listTwo = new List(3, 4, 5)
        const expected = 'superlist'

        expect(listOne.compare(listTwo)).toEqual(expected)
    })

    it('first list missing element from second list', () => {
        const listOne = new List(1, 3)
        const listTwo = new List(1, 2, 3)
        const expected = 'unequal'

        expect(listOne.compare(listTwo)).toEqual(expected)
    })

    it('second list missing element from first list', () => {
        const listOne = new List(1, 2, 3)
        const listTwo = new List(1, 3)
        const expected = 'unequal'

        expect(listOne.compare(listTwo)).toEqual(expected)
    })

    it('order matters to a list', () => {
        const listOne = new List(1, 2, 3)
        const listTwo = new List(3, 2, 1)
        const expected = 'unequal'

        expect(listOne.compare(listTwo)).toEqual(expected)
    })

    it('same digits but different numbers', () => {
        const listOne = new List(1, 0, 1)
        const listTwo = new List(10, 1)
        const expected = 'unequal'

        expect(listOne.compare(listTwo)).toEqual(expected)
    })
})

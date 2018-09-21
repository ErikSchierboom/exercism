import BracketPush from './bracket-push'

describe('Bracket Push', () => {
    it('paired square brackets', () => {
        const bracketPush = new BracketPush('[]')
        expect(bracketPush.isPaired()).toBeTruthy()
    })

    it('empty string', () => {
        const bracketPush = new BracketPush('')
        expect(bracketPush.isPaired()).toBeTruthy()
    })

    it('unpaired brackets', () => {
        const bracketPush = new BracketPush('[[')
        expect(bracketPush.isPaired()).toBeFalsy()
    })

    it('wrong ordered brackets', () => {
        const bracketPush = new BracketPush('}{')
        expect(bracketPush.isPaired()).toBeFalsy()
    })

    it('wrong closing bracket', () => {
        const bracketPush = new BracketPush('{]')
        expect(bracketPush.isPaired()).toBeFalsy()
    })

    it('paired with whitespace', () => {
        const bracketPush = new BracketPush('{ }')
        expect(bracketPush.isPaired()).toBeTruthy()
    })

    it('simple nested brackets', () => {
        const bracketPush = new BracketPush('{[]}')
        expect(bracketPush.isPaired()).toBeTruthy()
    })

    it('several paired brackets', () => {
        const bracketPush = new BracketPush('{}[]')
        expect(bracketPush.isPaired()).toBeTruthy()
    })

    it('paired and nested brackets', () => {
        const bracketPush = new BracketPush('([{}({}[])])')
        expect(bracketPush.isPaired()).toBeTruthy()
    })

    it('unopened closing brackets', () => {
        const bracketPush = new BracketPush('{[)][]}')
        expect(bracketPush.isPaired()).toBeFalsy()
    })

    it('unpaired and nested brackets', () => {
        const bracketPush = new BracketPush('([{])')
        expect(bracketPush.isPaired()).toBeFalsy()
    })

    it('paired and wrong nested brackets', () => {
        const bracketPush = new BracketPush('[({]})')
        expect(bracketPush.isPaired()).toBeFalsy()
    })

    it('math expression', () => {
        const bracketPush = new BracketPush('(((185 + 223.85) * 15) - 543)/2')
        expect(bracketPush.isPaired()).toBeTruthy()
    })

    it('complex latex expression', () => {
        const bracketPush = new BracketPush('\\left(\\begin{array}{cc} \\frac{1}{3} & x\\\\ \\mathrm{e}^{x} &... x^2 \\end{array}\\right)')
        expect(bracketPush.isPaired()).toBeTruthy()
    })
})

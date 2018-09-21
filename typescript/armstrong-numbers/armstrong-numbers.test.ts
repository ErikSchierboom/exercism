import ArmstrongNumbers from './armstrong-numbers'

describe('Armstrong Numbers', () => {
    it('Single digit numbers are Armstrong numbers', () => {
        expect(ArmstrongNumbers.isArmstrongNumber(5)).toBeTruthy()
    })

    it('There are no 2 digit Armstrong numbers', () => {
        expect(ArmstrongNumbers.isArmstrongNumber(10)).toBeFalsy()
    })

    it('Three digit number that is an Armstrong number', () => {
        expect(ArmstrongNumbers.isArmstrongNumber(153)).toBeTruthy()
    })

    it('Three digit number that is not an Armstrong number', () => {
        expect(ArmstrongNumbers.isArmstrongNumber(100)).toBeFalsy()
    })

    it('Four digit number that is an Armstrong number', () => {
        expect(ArmstrongNumbers.isArmstrongNumber(9474)).toBeTruthy()
    })

    it('Four digit number that is not an Armstrong number', () => {
        expect(ArmstrongNumbers.isArmstrongNumber(9475)).toBeFalsy()
    })

    it('Seven digit number that is an Armstrong number', () => {
        expect(ArmstrongNumbers.isArmstrongNumber(9926315)).toBeTruthy()
    })

    it('Seven digit number that is not an Armstrong number', () => {
        expect(ArmstrongNumbers.isArmstrongNumber(9926314)).toBeFalsy()
    })
})

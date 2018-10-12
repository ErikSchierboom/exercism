export default class ComplexNumber {
    public real: number
    public imag: number

    constructor(real: number, imag: number) {
        this.real = real
        this.imag = imag
    }

    public mul(other: ComplexNumber) {
        return new ComplexNumber(this.real * other.real - this.imag * other.imag, this.imag * other.real + this.real * other.imag)
    }

    public add(other: ComplexNumber) {
        return new ComplexNumber(this.real + other.real, this.imag + other.imag)
    }

    public sub(other: ComplexNumber) {
        return new ComplexNumber(this.real - other.real, this.imag - other.imag)
    }

    public div(other: ComplexNumber) {
        const real = (this.real * other.real + this.imag * other.imag) / (other.real ** 2 + other.imag ** 2)
        const imaginary = (this.imag * other.real - this.real * other.imag) / (other.real ** 2 + other.imag ** 2)

        return new ComplexNumber(real, imaginary)
    }

    public get abs() {
        return Math.sqrt(this.real ** 2 + this.imag ** 2)
    }

    public get conj() {
        return new ComplexNumber(this.real, this.imag === 0 ? 0 : this.imag * -1)
    }

    public get exp() {
        return new ComplexNumber(Math.exp(this.real) * Math.cos(this.imag), Math.exp(this.real) * Math.sin(this.imag))
    }
}
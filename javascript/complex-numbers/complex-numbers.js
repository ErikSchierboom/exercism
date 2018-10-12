export default class ComplexNumber {
    constructor(real, imag) {
        this.real = real
        this.imag = imag
    }

    mul(other) {
        return new ComplexNumber(this.real * other.real - this.imag * other.imag, this.imag * other.real + this.real * other.imag)
    }

    add(other) {
        return new ComplexNumber(this.real + other.real, this.imag + other.imag)
    }

    sub(other) {
        return new ComplexNumber(this.real - other.real, this.imag - other.imag)
    }

    div(other) {
        const real = (this.real * other.real + this.imag * other.imag) / (other.real ** 2 + other.imag ** 2)
        const imaginary = (this.imag * other.real - this.real * other.imag) / (other.real ** 2 + other.imag ** 2)

        return new ComplexNumber(real, imaginary)
    }

    get abs() {
        return Math.sqrt(this.real ** 2 + this.imag ** 2)
    }

    get conj() {
        return new ComplexNumber(this.real, this.imag === 0 ? 0 : this.imag * -1)
    }

    get exp() {
        return new ComplexNumber(Math.exp(this.real) * Math.cos(this.imag), Math.exp(this.real) * Math.sin(this.imag))
    }
}
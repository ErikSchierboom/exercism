fun exponential(complexNumber: ComplexNumber) =
    ComplexNumber(Math.exp(complexNumber.real) * Math.cos(complexNumber.imaginary), Math.exp(complexNumber.real) * Math.sin(complexNumber.imaginary))

data class ComplexNumber(val real: Double = 0.0, val imaginary: Double = 0.0)
{
    val abs = Math.sqrt(real * real + imaginary * imaginary)

    operator fun times(other: ComplexNumber) = ComplexNumber(real * other.real - imaginary * other.imaginary, imaginary * other.real + real * other.imaginary)

    operator fun plus(other: ComplexNumber) = ComplexNumber(real + other.real, imaginary + other.imaginary)

    operator fun minus(other: ComplexNumber) = ComplexNumber(real - other.real, imaginary - other.imaginary)

    operator fun div(other: ComplexNumber): ComplexNumber  {
        val denominator = other.real * other.real + other.imaginary * other.imaginary
        val divReal = (real * other.real + imaginary * other.imaginary) / denominator
        val divImaginary = (imaginary * other.real - real * real * other.imaginary) / denominator

        return ComplexNumber(divReal, divImaginary)
    }

    fun conjugate() = ComplexNumber(real, -imaginary)
}
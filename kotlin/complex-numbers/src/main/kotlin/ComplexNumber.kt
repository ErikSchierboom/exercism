import kotlin.math.cos
import kotlin.math.exp
import kotlin.math.sin
import kotlin.math.sqrt

data class ComplexNumber(val real: Double = 0.0, val imaginary: Double = 0.0)
{
    val abs = sqrt(real * real + imaginary * imaginary)

    operator fun plus(other: ComplexNumber) =
        ComplexNumber(real + other.real, imaginary + other.imaginary)

    operator fun minus(other: ComplexNumber) =
        ComplexNumber(real - other.real, imaginary - other.imaginary)

    operator fun times(other: ComplexNumber) =
        ComplexNumber(real * other.real - imaginary * other.imaginary, imaginary * other.real + real * other.imaginary)

    operator fun div(other: ComplexNumber): ComplexNumber  {
        val numerator = times(other.conjugate())
        val denominator = other.times(other.conjugate())

        return ComplexNumber(numerator.real / denominator.real, numerator.imaginary / denominator.real)
    }

    fun conjugate() = ComplexNumber(real, -imaginary)
}

fun exponential(complexNumber: ComplexNumber) =
    ComplexNumber(exp(complexNumber.real) * cos(complexNumber.imaginary), exp(complexNumber.real) * sin(complexNumber.imaginary))
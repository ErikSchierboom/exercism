case class ComplexNumber(real: Double = 0.0, imaginary: Double = 0.0) {
  lazy val conjugate: ComplexNumber = this.copy(imaginary = -imaginary)
  lazy val abs: Double = Math.sqrt(real * real + imaginary * imaginary)

  def +(other: ComplexNumber) = ComplexNumber(real + other.real, imaginary + other.imaginary)
  def -(other: ComplexNumber) = ComplexNumber(real - other.real, imaginary - other.imaginary)
  def *(other: ComplexNumber) = ComplexNumber(real * other.real - imaginary * other.imaginary, imaginary * other.real + real * other.imaginary)
  def /(other: ComplexNumber): ComplexNumber = {
    val denominator = other.real * other.real + other.imaginary * other.imaginary
    val divReal = (real * other.real + imaginary * other.imaginary) / denominator
    val divImaginary = (imaginary * other.real - real * other.imaginary) / denominator
    ComplexNumber(divReal, divImaginary)
  }
}

object ComplexNumber {
  def exp(z: ComplexNumber) = ComplexNumber(Math.exp(z.real) * Math.cos(z.imaginary), Math.exp(z.real) * Math.sin(z.imaginary))
}
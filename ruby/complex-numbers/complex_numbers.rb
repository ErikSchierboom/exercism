class ComplexNumber
  attr_reader :real, :imaginary

  def initialize(r, i)
    @real = r.to_f
    @imaginary = i.to_f
  end

  def ==(other)
    other.class == self.class && other.abs - abs < 1e-10
  end

  def +(other)
    ComplexNumber.new(real + other.real, imaginary + other.imaginary)
  end

  def -(other)
    ComplexNumber.new(real - other.real, imaginary - other.imaginary)
  end

  def *(other)
    ComplexNumber.new(real * other.real - imaginary * other.imaginary, imaginary * other.real + real * other.imaginary)
  end

  def /(other)
    numerator = self * other.conjugate
    denominator = other * other.conjugate
    ComplexNumber.new(numerator.real / denominator.real, numerator.imaginary / denominator.real)
  end

  def conjugate
    ComplexNumber.new(real, -imaginary)
  end

  def exp
    ComplexNumber.new(Math.exp(real) * Math.cos(imaginary), Math.exp(real) * Math.sin(imaginary))
  end

  def abs
    Math.sqrt(real**2 + imaginary**2)
  end
end
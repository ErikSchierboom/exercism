object Grains {
  def square(number: Int): BigInt = BigInt(2).pow(number - 1)

  def total: BigInt = (1 to 64).map(square).sum
}

object Grains {
  def square(number: Int): BigInt = BigInt(2).pow(number - 1)

  lazy val total: BigInt = (1 to 64).map(square).sum
}

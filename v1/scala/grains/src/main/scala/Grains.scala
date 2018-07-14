object Grains {
  def square(number: Int): BigInt = BigInt(2).pow(number - 1)

  lazy val total: BigInt = square(65) - 1
}

case class Year(year: Int) {
  def isDivisibleBy(divisor: Int) = year % divisor == 0

  def isLeap: Boolean = isDivisibleBy(4) && (!isDivisibleBy(100) || isDivisibleBy(400))
}
object ArmstrongNumbers {
  def isArmstrongNumber(number: Int): Boolean ={
    val digits = number.toString.map(_.asDigit)
    val sumOfDigitsToPower = digits.map(Math.pow(_, digits.length)).sum
    sumOfDigitsToPower == number
  }
}

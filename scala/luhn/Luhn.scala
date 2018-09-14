class Luhn(val number: Long) {

  private def addend(digitWithIndex: (Char, Int)) = digitWithIndex match {
    case (digit, index) if index % 2 == 0     => digit.asDigit
    case (digit, _)     if digit.asDigit >= 5 => digit.asDigit * 2 - 9
    case (digit, _)                           => digit.asDigit * 2
  }

  def addends = number.toString.reverse.zipWithIndex.map(addend).reverse
  def checkDigit = number % 10
  def checksum = addends.sum % 10
  def isValid = checksum == 0
  def create = {
    val targetNumber = number * 10
    val targetLuhn = Luhn(targetNumber)
    if (targetLuhn.isValid) targetNumber else targetNumber + (10 - (targetLuhn.checksum % 10))
  }
}

object Luhn {
  def apply(number: Long) = new Luhn(number)
}
object Say {
  def quotRem(x: Long, y: Long) = {
    val div = x / y
    val rem = x % y
    (div, rem)
  }

  val basesValues =
    List(
      "",
      "one",
      "two",
      "three",
      "four",
      "five",
      "six",
      "seven",
      "eight",
      "nine",
      "ten",
      "eleven",
      "twelve",
      "thirteen",
      "fourteen",
      "fifteen",
      "sixteen",
      "seventeen",
      "eighteen",
      "nineteen")

  def bases(n: Long) =
    if (n < 1 || n >= basesValues.length) None
    else Some(basesValues(n.toInt))

  val tensValues =
    List(
      "",
      "",
      "twenty",
      "thirty",
      "forty",
      "fifty",
      "sixty",
      "seventy",
      "eighty",
      "ninety")

  def tens(n: Long) = {
    if (n < 20) bases(n)
    else {
      val (count, remainder) = quotRem(n, 10)
      val countStr = tensValues(count.toInt)
      val baseStr = bases(remainder).fold("") {
        "-" + _
      }
      Some(countStr + baseStr)
    }
  }

  def hundreds(n: Long) = {
    if (n < 100) tens(n)
    else {
      val (count, remainder) = quotRem(n, 100)
      val tensStr = tens(remainder).fold("") {
        " " + _
      }
      bases(count).flatMap { x => Some(x + " hundred" + tensStr) }
    }
  }

  def chunk(str: String)(n: Long) = hundreds(n).flatMap { x => Some(x + " " + str) }

  def thousands = chunk("thousand")_

  def millions = chunk("million")_

  def billions = chunk("billion")_

  def parts(n: Long) = {
    val (billionsCount, billionsRemainder) = quotRem(n, 1000000000L)
    val (millionsCount, millionsRemainder) = quotRem(billionsRemainder, 1000000L)
    val (thousandsCount, remainder) = quotRem(millionsRemainder, 1000L)
    (billionsCount, millionsCount, thousandsCount, remainder)
  }

  def inEnglish(n: Long) = {
    if (n < 0 || n >= 1000000000000L) None
    else if (n == 0) Some("zero")
    else {
      val (billionsCount, millionsCount, thousandsCount, remainder) = parts(n)
      val partStrings = List(billions(billionsCount),
        millions(millionsCount),
        thousands(thousandsCount),
        hundreds(remainder))
      val str = partStrings
        .collect { case Some(x) => x }
        .mkString(" ")
      Some(str)
    }
  }
}
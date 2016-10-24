object Brackets {
  val brackets = "[]{}()".toCharArray.toSet

  def areBalanced(input: String) = {
    def replaceMatchingBrackets(str: String) =
      str
        .replace("[]", "")
        .replace("{}", "")
        .replace("()", "")

    def loop(remainder: String): Boolean = {
      if (remainder.isEmpty) {
        true
      }
      else {
        val updated = replaceMatchingBrackets(remainder)
        if (updated.length == remainder.length) {
          false
        }
        else {
          loop(updated)
        }
      }
    }

    val filtered = input.filter(brackets(_))
    loop(filtered)
  }
}
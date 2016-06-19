object BracketPush {
    val brackets = "[]{}()".toSet()

    fun replaceMatchingBrackets(input: String) = input.replace("[]", "").replace("{}", "").replace("()", "")

    fun isValid(input: String): Boolean {
        tailrec fun loop(remaining: String): Boolean {
            if (remaining.isEmpty()) {
                return true
            }
            else {
                val updated = replaceMatchingBrackets(remaining)
                return if (updated.length == remaining.length) false else loop(updated)
            }
        }

        return loop(input.filter { it in brackets })
    }
}
class StringUtil {
  static reverse(string) {
    var reversed = ""
    for (c in string) {
      reversed = c + reversed
    }
    return reversed
  }
}

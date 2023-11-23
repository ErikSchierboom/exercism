class Year {
  static isLeap(n) { n % 4 == 0 && (n % 100 != 0 || n % 400 == 0) }
}

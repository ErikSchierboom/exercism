object CollatzConjecture {
  def steps(number: Int): Option[Int] = stepsHelper(0, number)

  private def stepsHelper(count: Int, current: Int): Option[Int] = {
    current match {
      case 1 => Some(count)
      case x if x <= 0 => None
      case x if x % 2 == 0 => stepsHelper(count + 1, x / 2)
      case x => stepsHelper(count + 1, x * 3 + 1)
    }
  }
}

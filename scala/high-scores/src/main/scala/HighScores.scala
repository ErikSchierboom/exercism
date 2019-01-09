object HighScores {
  def latest(scores: List[Int]): Int = scores.last

  def personalBest(scores: List[Int]): Int = scores.max

  def personalTop(scores: List[Int]): List[Int] = scores.sorted(Ordering[Int].reverse).take(3)

  def report(scores: List[Int]): String = {
    val latestScoreReport = s"Your latest score was ${latest(scores)}."

    val differenceOfLatestToPersonalBest = personalBest(scores) - latest(scores)
    val latestScoreComparedToPersonalBestReport =
      if (differenceOfLatestToPersonalBest == 0)
        "That's your personal best!"
      else
        s"That's $differenceOfLatestToPersonalBest short of your personal best!"

    s"$latestScoreReport $latestScoreComparedToPersonalBestReport"
  }
}

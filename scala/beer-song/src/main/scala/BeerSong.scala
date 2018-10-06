object BeerSong {
  def recite(startBottles: Int, takeDown: Int): String =
    bottles(startBottles, takeDown).map(verse).mkString("\n")

  private def bottles(startBottles: Int, takeDown: Int) =
    startBottles to (startBottles - takeDown + 1) by -1

  private def verse(number: Int) =
    s"${bottlesOfBeerOnTheWall(number).capitalize}, ${bottlesOfBeer(number)}.\n" +
    s"${takeDown(number)}, ${bottlesOfBeerOnTheWall(if (number == 0) 99 else number - 1)}.\n"

  private def bottlesOfBeerOnTheWall(number: Int) = s"${bottlesOfBeer(number)} on the wall"

  private def bottlesOfBeer(number: Int) = s"${bottles(number)} of beer"

  private def bottles(number: Int) =
    number match {
      case 0 => "no more bottles"
      case 1 => "1 bottle"
      case _ => s"$number bottles"
    }

  private def takeDown(number: Int) =
    number match {
      case 0 => "Go to the store and buy some more"
      case 1 => "Take it down and pass it around"
      case _ => "Take one down and pass it around"
    }
}

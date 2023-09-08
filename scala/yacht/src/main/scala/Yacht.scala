object Yacht {

  def score(dice: List[Int], category: String): Int =
    category match {
      case "ones" => scoreSingle(dice, 1)
      case "twos" => scoreSingle(dice, 2)
      case "threes" => scoreSingle(dice, 3)
      case "fours" => scoreSingle(dice, 4)
      case "fives" => scoreSingle(dice, 5)
      case "sixes" => scoreSingle(dice, 6)
      case "full house" => scoreFullHouse(dice)
      case "four of a kind" => scoreFourOfAKind(dice)
      case "little straight" => scoreLittleStraight(dice)
      case "big straight" => scoreBigStraight(dice)
      case "yacht" => scoreYacht(dice)
      case "choice" => scoreChoice(dice)
    }

  private def scoreSingle(dices: List[Int], dice: Int) : Int = dices.filter(_ == dice).sum

  private def scoreFullHouse(dice: List[Int]): Int =
    dice.groupBy(identity).view.mapValues(_.size).toList.sortBy(_._2) match {
      case List((_, 2), (_, 3)) => dice.sum
      case _ => 0
    }

  private def scoreFourOfAKind(dice: List[Int]): Int =
    dice.groupBy(identity).view.mapValues(_.size).toList.sortBy(_._2) match {
      case List((_, 1), (die, 4)) => die * 4
      case List((die, 5)) => die * 4
      case _ => 0
    }

  private def scoreLittleStraight(dice: List[Int]): Int =
    dice.sorted match {
      case List(1, 2, 3, 4, 5) => 30
      case _ => 0
    }

  private def scoreBigStraight(dice: List[Int]): Int =
    dice.sorted match {
      case List(2, 3, 4, 5, 6) => 30
      case _ => 0
    }

  private def scoreYacht(dice: List[Int]): Int = if (dice.distinct.size == 1) 50 else 0
  private def scoreChoice(dices: List[Int]): Int = dices.sum
}

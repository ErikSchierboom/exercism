sealed trait Bowling {
  def roll(pins: Int): Bowling

  def score(): Either[Error, Int]
}

case class BowlingImpl(rolls: Either[Error, List[Int]]) extends Bowling {
  val numberOfFrames = 10
  val maximumFrameScore = 10
  val minimumFrameScore = 0

  def roll(pins: Int) = {
    val updatedRolls = validatePins(pins).right.flatMap(x => rolls.right.map(_ ++ List(x)))
    BowlingImpl(updatedRolls)
  }

  def score(): Either[Error, Int] = rolls.right.flatMap(scoreRolls(0, 1, _))

  def validatePins(pins: Int) =
    if (pins < minimumFrameScore || pins > maximumFrameScore)
      Left(Error("Invalid pins"))
    else
      Right(pins)

  def isStrike(pins: Int) = pins == maximumFrameScore

  def isSpare(pins1: Int, pins2: Int) = pins1 + pins2 == maximumFrameScore

  def scoreRolls(totalScore: Int, frame: Int, rolls: List[Int]): Either[Error, Int] = {
    val isLastFrame = frame == numberOfFrames
    val gameFinished = frame == numberOfFrames + 1

    def scoreStrike(remainder: List[Int]) =
      remainder match {
        case x :: y :: zs if isLastFrame =>
          if (x + y > 10 && x != 10) Left(Error("Invalid strike"))
          else scoreRolls(totalScore + 10 + x + y, frame + 1, zs)
        case x :: y :: zs =>
          scoreRolls(totalScore + 10 + x + y, frame + 1, x :: y :: zs)
        case _ =>
          Left(Error("Invalid strike"))
      }

    def scoreSpare(x: Int, y: Int, remainder: List[Int]) =
      remainder match {
        case z :: zs => scoreRolls(totalScore + x + y + z, frame + 1, if (isLastFrame) zs else z :: zs)
        case _ => Left(Error("Invalid spare"))
      }

    def scoreNormal(x: Int, y: Int, remainder: List[Int]) =
      validatePins(x + y) match {
        case Right(z) => scoreRolls(totalScore + z, frame + 1, remainder)
        case Left(l) => Left(l)
      }

    rolls match {
      case Nil =>
        if (gameFinished) Right(totalScore) else Left(Error("Invalid rolls"))
      case x :: xs if isStrike(x) => scoreStrike(xs)
      case x :: y :: ys if isSpare(x, y) => scoreSpare(x, y, ys)
      case x :: y :: zs => scoreNormal(x, y, zs)
      case _ => Left(Error("Invalid state"))
    }
  }
}

object Bowling {
  def apply(): Bowling = BowlingImpl(Right(Nil))
}

case class Error(errorText: String)
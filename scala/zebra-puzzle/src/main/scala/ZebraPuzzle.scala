object ZebraPuzzle {

  sealed trait Resident
  case object Englishman extends Resident
  case object Spaniard extends Resident
  case object Ukrainian extends Resident
  case object Norwegian extends Resident
  case object Japanese extends Resident

  sealed trait Color
  case object Red extends Color
  case object Green extends Color
  case object Ivory extends Color
  case object Yellow extends Color
  case object Blue extends Color

  sealed trait Pet
  case object Dog extends Pet
  case object Snails extends Pet
  case object Fox extends Pet
  case object Horse extends Pet
  case object Zebra extends Pet

  sealed trait Drink
  case object Coffee extends Drink
  case object Tea extends Drink
  case object Milk extends Drink
  case object OrangeJuice extends Drink
  case object Water extends Drink

  sealed trait Smoke
  case object OldGold extends Smoke
  case object Kools extends Smoke
  case object Chesterfields extends Smoke
  case object LuckyStrike extends Smoke
  case object Parliaments extends Smoke

  case class Solution(waterDrinker: Resident, zebraOwner: Resident)

  lazy val solutions = {
    for {
      color <- List(Red, Green, Ivory, Yellow, Blue)
      resident <- List(Englishman, Spaniard, Ukrainian, Norwegian, Japanese)
      pet <- List(Dog, Snails, Fox, Horse, Zebra)
      drink <- List(Coffee, Tea, Milk, OrangeJuice, Water)
      smoke <- List(OldGold, Kools, Chesterfields, LuckyStrike, Parliaments)
    } yield Solution(Spaniard, Norwegian)
  }

  lazy val solve: Solution = solutions.head
}


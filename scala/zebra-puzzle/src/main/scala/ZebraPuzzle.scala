object ZebraPuzzle {

  sealed trait Resident
  case object Englishman extends Resident
  case object Spaniard extends Resident
  case object Ukrainian extends Resident
  case object Norwegian extends Resident
  case object Japanese extends Resident
  object Resident {
    val all = List(Englishman, Spaniard, Ukrainian, Norwegian, Japanese)
  }

  sealed trait Color
  case object Red extends Color
  case object Green extends Color
  case object Ivory extends Color
  case object Yellow extends Color
  case object Blue extends Color
  object Color {
    val all = List(Red, Green, Ivory, Yellow, Blue)
  }

  sealed trait Pet
  case object Dog extends Pet
  case object Snails extends Pet
  case object Fox extends Pet
  case object Horse extends Pet
  case object Zebra extends Pet
  object Pet {
    val all = List(Dog, Snails, Fox, Horse, Zebra)
  }

  sealed trait Drink
  case object Coffee extends Drink
  case object Tea extends Drink
  case object Milk extends Drink
  case object OrangeJuice extends Drink
  case object Water extends Drink
  object Drink {
    val all = List(Coffee, Tea, Milk, OrangeJuice, Water)
  }

  sealed trait Smoke
  case object OldGold extends Smoke
  case object Kools extends Smoke
  case object Chesterfields extends Smoke
  case object LuckyStrike extends Smoke
  case object Parliaments extends Smoke
  object Smoke {
    val all = List(OldGold, Kools, Chesterfields, LuckyStrike, Parliaments)
  }

  case class Solution(waterDrinker: Resident, zebraOwner: Resident)

  def matchingIndex[A, B](values1: List[A], value1: A)(values2: List[B], value2: B) =
    values2(values1.indexOf(value1)) == value2

  def nextTo[A, B](values1: List[A], value1: A)(values2: List[B], value2: B) = {
    val index = values1.indexOf(value1)
    val toTheLeft = index > 0 && values2(index - 1) == value2
    val toTheRight = index < values2.length - 1 && values2(index + 1) == value2
    toTheLeft || toTheRight
  }

  def matchesColorRules(colors: List[Color]) = {
    val greenRightOfIvoryHouse = colors.indexOf(Ivory) == colors.indexOf(Green) - 1 // #6
    greenRightOfIvoryHouse
  }

  def matchesResidentRules(colors: List[Color], residents: List[Resident]) = {
    val englishManInRedHouse = matchingIndex(residents, Englishman)(colors, Red) // #2
    val norwegianInFirstHouse = residents.head == Norwegian // #10
    val norwegianLivesNextToBlueHouse = nextTo(residents, Norwegian)(colors, Blue) // #15

    englishManInRedHouse && norwegianInFirstHouse && norwegianLivesNextToBlueHouse
  }

  def matchesPetRules(residents: List[Resident], pets: List[Pet]) = {
    val spaniardOwnsDog = matchingIndex(residents, Spaniard)(pets, Dog) // #3
    spaniardOwnsDog
  }

  def matchesDrinkRules(colors: List[Color], residents: List[Resident], drinks: List[Drink]) = {
    val coffeeDrunkInGreenHouse = matchingIndex(colors, Green)(drinks, Coffee) // #4
    val ukranianDrinksTee = matchingIndex(residents, Ukrainian)(drinks, Tea) // #5
    val milkDrunkInMiddleHouse = drinks(2) == Milk // #9
    coffeeDrunkInGreenHouse && ukranianDrinksTee && milkDrunkInMiddleHouse
  }

  def matchesSmokeRules(colors: List[Color], nationalities: List[Resident], drinks: List[Drink], pets: List[Pet], smokes: List[Smoke]) = {
    val oldGoldSmokesOwnsSnails = matchingIndex(smokes, OldGold)(pets, Snails) // #7
    val koolsSmokedInYellowHouse = matchingIndex(colors, Yellow)(smokes, Kools) // #8
    val chesterfieldsSmokedNextToHouseWithFox = nextTo(smokes, Chesterfields)(pets, Fox) // #11
    val koolsSmokedNextToHouseWithHorse = nextTo(smokes, Kools)(pets, Horse) // #12

    val luckyStrikeSmokerDrinksOrangeJuice = matchingIndex(smokes, LuckyStrike)(drinks, OrangeJuice) // #13
    val japaneseSmokesParliaments = matchingIndex(nationalities, Japanese)(smokes, Parliaments) // #14

    oldGoldSmokesOwnsSnails && koolsSmokedInYellowHouse && chesterfieldsSmokedNextToHouseWithFox &&
      koolsSmokedNextToHouseWithHorse && luckyStrikeSmokerDrinksOrangeJuice && japaneseSmokesParliaments
  }

  lazy val solutions = {
    for {
      colors <- Color.all.permutations if matchesColorRules(colors)
      residents <- Resident.all.permutations if matchesResidentRules(colors, residents)
      pets <- Pet.all.permutations if matchesPetRules(residents, pets)
      drinks <- Drink.all.permutations if matchesDrinkRules(colors, residents, drinks)
      smokes <- Smoke.all.permutations if matchesSmokeRules(colors, residents, drinks, pets, smokes)
    } yield Solution(residents(drinks.indexOf(Water)), residents(pets.indexOf(Zebra)))
  }

  val solve: Solution = solutions.toList.head
}


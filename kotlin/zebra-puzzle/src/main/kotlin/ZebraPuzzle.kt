import kotlin.math.absoluteValue

enum class Color { Red, Green, Ivory, Yellow, Blue }
enum class Resident { Englishman, Spaniard, Ukrainian, Norwegian, Japanese }
enum class Pet { Dog, Snails, Fox, Horse, Zebra }
enum class Drink { Coffee, Tea, Milk, OrangeJuice, Water }
enum class Smoke { OldGold, Kools, Chesterfields, LuckyStrike, Parliaments }

data class Solution(
    val colors: List<Color>,
    val residents: List<Resident>,
    val pets: List<Pet>,
    val drinks: List<Drink>,
    val smokes: List<Smoke>
)

class ZebraPuzzle {
    fun drinksWater() = solution.residents[solution.drinks.indexOf(Drink.Water)].name
    fun ownsZebra() = solution.residents[solution.pets.indexOf(Pet.Zebra)].name

    private val solution = calculateSolution()

    private fun calculateSolution(): Solution {
        for (colors in permutations<Color>().filter { it.matchesColorRules() }) {
            for (residents in permutations<Resident>().filter { it.matchesResidentRules(colors) }) {
                for (pets in permutations<Pet>().filter { it.matchesPetRules(residents) }) {
                    for (drinks in permutations<Drink>().filter { it.matchesDrinkRules(colors, residents) }) {
                        for (smokes in permutations<Smoke>().filter { it.matchesSmokeRules(colors, residents, drinks, pets) }) {
                            return Solution(colors, residents, pets, drinks, smokes)
                        }
                    }
                }
            }
        }

        throw Exception("No solution could be found")
    }

    private fun List<Color>.matchesColorRules() =
        indexOf(Color.Green) == indexOf(Color.Ivory) + 1

    private fun List<Resident>.matchesResidentRules(colors: List<Color>) =
        indexOf(Resident.Norwegian) == 0 &&
                indexOf(Resident.Englishman) == colors.indexOf(Color.Red) &&
                (indexOf(Resident.Norwegian) - colors.indexOf(Color.Blue)).absoluteValue == 1

    private fun List<Pet>.matchesPetRules(residents: List<Resident>) =
        indexOf(Pet.Dog) == residents.indexOf(Resident.Spaniard)

    private fun List<Drink>.matchesDrinkRules(colors: List<Color>, residents: List<Resident>) =
        indexOf(Drink.Coffee) == colors.indexOf(Color.Green) &&
                indexOf(Drink.Tea) == residents.indexOf(Resident.Ukrainian) &&
                indexOf(Drink.Milk) == 2

    private fun List<Smoke>.matchesSmokeRules(
        colors: List<Color>,
        residents: List<Resident>,
        drinks: List<Drink>,
        pets: List<Pet>
    ) =
        indexOf(Smoke.OldGold) == pets.indexOf(Pet.Snails) &&
                indexOf(Smoke.Kools) == colors.indexOf(Color.Yellow) &&
                (indexOf(Smoke.Chesterfields) - pets.indexOf(Pet.Fox)).absoluteValue == 1 &&
                (indexOf(Smoke.Kools) - pets.indexOf(Pet.Horse)).absoluteValue == 1 &&
                indexOf(Smoke.LuckyStrike) == drinks.indexOf(Drink.OrangeJuice) &&
                indexOf(Smoke.Parliaments) == residents.indexOf(Resident.Japanese)
}

private inline fun <reified T : Enum<T>> permutations() = enumValues<T>().toList().permutations()

private fun <T> List<T>.permutations(): Sequence<List<T>> =
    if (size <= 1) sequenceOf(this)
    else asSequence().flatMap { seq -> (this - seq).permutations().map { listOf(seq) + it } }

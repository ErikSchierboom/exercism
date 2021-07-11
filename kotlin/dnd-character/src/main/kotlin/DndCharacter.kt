import kotlin.random.Random

class DndCharacter {
    val strength: Int = ability()
    val dexterity: Int = ability()
    val constitution: Int = ability()
    val intelligence: Int = ability()
    val wisdom: Int = ability()
    val charisma: Int = ability()
    val hitpoints: Int = 10 + modifier(constitution)

    companion object {
        fun ability(): Int = List(4) { Die.roll() }.sorted().takeLast(3).sum()

        fun modifier(score: Int) = Math.floorDiv(score - 10, 2)
    }
}

object Die {
    fun roll() = Random.nextInt(1, 6.inc())
}
object Yacht {
    fun solve(category: YachtCategory, vararg dices: Int) = when(category) {
        YachtCategory.ONES -> dices.digitScore(1)
        YachtCategory.TWOS -> dices.digitScore(2)
        YachtCategory.THREES -> dices.digitScore(3)
        YachtCategory.FOURS -> dices.digitScore(4)
        YachtCategory.FIVES -> dices.digitScore(5)
        YachtCategory.SIXES -> dices.digitScore(6)
        YachtCategory.FULL_HOUSE -> dices.fullHouseScore()
        YachtCategory.FOUR_OF_A_KIND -> dices.fourOfAKindScore()
        YachtCategory.LITTLE_STRAIGHT -> dices.littleStraightScore()
        YachtCategory.BIG_STRAIGHT -> dices.bigStraightScore()
        YachtCategory.YACHT -> dices.yachtScore()
        YachtCategory.CHOICE -> dices.choiceScore()
    }

    private fun IntArray.digitScore(digit: Int) = count { it == digit } * digit
    private fun IntArray.fullHouseScore() = diceByCount().let { if (2 in it && 3 in it) sum() else 0 }
    private fun IntArray.fourOfAKindScore() = diceByCount().let { (it[4] ?: it[5] ?: 0) * 4 }
    private fun IntArray.littleStraightScore() = if (straight() && 6 !in this) 30 else 0
    private fun IntArray.bigStraightScore() = if (straight() && 1 !in this) 30 else 0
    private fun IntArray.yachtScore() = if (distinct().size == 1) 50 else 0
    private fun IntArray.choiceScore() = sum()

    private fun IntArray.straight() = distinct().size == 5
    private fun IntArray.diceByCount() = groupBy { it }.map { it.value.size to it.key }.toMap()
}

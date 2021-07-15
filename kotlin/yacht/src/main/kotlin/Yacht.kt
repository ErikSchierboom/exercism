object Yacht {
    fun solve(category: YachtCategory, vararg dices: Int): Int = when(category) {
        YachtCategory.YACHT -> dices.yachtScore()
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
        YachtCategory.CHOICE -> dices.choiceScore()
    }

    private fun IntArray.digitScore(digit: Int) = this.count { it == digit } * digit
    private fun IntArray.choiceScore() = this.sum()
    private fun IntArray.fullHouseScore() = this.diceCount().let { if (2 in it && 3 in it) this.sum() else 0 }
    private fun IntArray.fourOfAKindScore() = this.diceCount().let { (it[4] ?: it[5] ?: 0) * 4 }
    private fun IntArray.yachtScore() = if (this.distinct().size == 1) 50 else 0
    private fun IntArray.littleStraightScore() = if (this.distinct().size == 5 && 6 !in this) 30 else 0
    private fun IntArray.bigStraightScore() = if (this.distinct().size == 5 && 1 !in this) 30 else 0

    private fun IntArray.diceCount() = this.groupBy { it }.map { it.value.size to it.key }.toMap()
}

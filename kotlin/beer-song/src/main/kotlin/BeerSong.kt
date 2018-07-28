object BeerSong {
    private fun bottlesOfBeer(count: Int) = when (count) {
        0 -> "No more bottles of beer"
        1 -> "1 bottle of beer"
        else -> "$count bottles of beer"
    }

    private fun instruction(number: Int) = when(number) {
        0 -> "Go to the store and buy some more"
        1 -> "Take it down and pass it around"
        else -> "Take one down and pass it around"
    }

    private fun verseFirstLine(number: Int) =
            "${bottlesOfBeer(number)} on the wall, ${bottlesOfBeer(number).toLowerCase()}.\n"

    private fun verseSecondLine(number: Int) =
            "${instruction(number)}, ${bottlesOfBeer(if (number == 0) 99 else number - 1).toLowerCase()} on the wall.\n"

    private fun verse(number: Int) = "${verseFirstLine(number)}${verseSecondLine(number)}"

    fun verses(stop: Int, start: Int): String =
        (stop downTo start)
            .map(::verse)
            .joinToString(separator = "\n" )
}
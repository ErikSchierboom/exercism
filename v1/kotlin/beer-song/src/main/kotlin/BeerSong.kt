object BeerSong {
    fun verse(number: Int): String {
        if (number < 0 || number > 99)
            throw IllegalArgumentException()

        return when (number) {
            0 -> "No more bottles of beer on the wall, no more bottles of beer.\nGo to the store and buy some more, 99 bottles of beer on the wall.\n"
            1 -> "1 bottle of beer on the wall, 1 bottle of beer.\nTake it down and pass it around, no more bottles of beer on the wall.\n"
            2 -> "2 bottles of beer on the wall, 2 bottles of beer.\nTake one down and pass it around, 1 bottle of beer on the wall.\n"
            else -> "$number bottles of beer on the wall, $number bottles of beer.\nTake one down and pass it around, " + (number - 1) + " bottles of beer on the wall.\n"
        }
    }

    fun verses(stop: Int, start: Int): String =
        (stop downTo start)
            .map { verse(it) }
            .joinToString(separator = "\n" )

    val lyrics = verses(99, 0)
}
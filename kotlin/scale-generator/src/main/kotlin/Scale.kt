class Scale(private val tonic: String) {
    fun chromatic(): List<String> {
        val scale = if ("#" in tonic) chromaticScale else flatChromaticScale
        return scale.shift(scale.indexOfFirst { it.equals(tonic, ignoreCase = true) })
    }

    fun interval(intervals: String): List<String> {
        val scale = chromatic()
        val indices = intervals.scan(0) { acc, interval -> acc + intervalOffsets[interval]!!}
        return indices.mapNotNull { scale.getOrNull(it) }
    }

    private fun <T> List<T>.shift(n: Int) = drop(n) + take(n)

    private val chromaticScale = listOf("C", "C#", "D", "D#", "E", "F", "F#", "G", "G#", "A", "A#", "B")
    private val flatChromaticScale = listOf("C", "Db", "D", "Eb", "E", "F", "Gb", "G", "Ab", "A", "Bb", "B")

    private val intervalOffsets = mapOf('m' to 1, 'M' to 2, 'A' to 3)
}

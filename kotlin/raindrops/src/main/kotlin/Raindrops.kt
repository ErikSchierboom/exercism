object Raindrops {
    private val drops = mapOf(3 to "Pling", 5 to "Plang", 7 to "Plong")

    fun convert(n: Int) =
        drops.filterKeys { n % it == 0 }
             .values
             .joinToString("")
             .ifEmpty { n.toString() }
}
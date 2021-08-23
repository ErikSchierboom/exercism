object ETL {
    fun transform(old: Map<Int, List<Char>>): Map<Char, Int> =
        old.flatMap { it.value.map { c -> c.lowercase().first() to it.key } }.toMap()
}
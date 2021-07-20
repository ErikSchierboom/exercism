object ETL {
    fun transform(old: Map<Int, List<Char>>) =
        old.flatMap { it.value.map { str -> str.toLowerCase() to it.key } }.toMap()
}
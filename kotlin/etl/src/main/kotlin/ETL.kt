object ETL {
    fun transform(old: Map<Int, List<String>>): Map<String, Int> {
        return old.flatMap { it.value.map { str -> Pair(str.toLowerCase(), it.key) } }
                  .toMap()
    }
}
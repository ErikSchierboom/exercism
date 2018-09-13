object Flattener {
    fun flatten(nestedList: List<Any?>): List<Any> =
            nestedList.filterNotNull().flatMap {
                when (it) {
                    is List<*> -> flatten(it)
                    else -> listOf(it)
                }
            }
}
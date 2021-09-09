object Flattener {
    fun flatten(nestedList: List<Any?>): List<Any> {
        val results = mutableListOf<Any>()

        for (x in nestedList.filterNotNull()) {
            when (x) {
                is List<*> -> results.addAll(flatten(x))
                else -> results.add(x)
            }
        }

        return results
    }
}
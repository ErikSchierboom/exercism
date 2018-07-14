object Strain {
    fun <T> keep(input: List<T>, predicate: (T) -> Boolean): List<T> {
        var output = mutableListOf<T>()

        for (x in input) {
            if (predicate.invoke(x))
                output.add(x)
        }

        return output
    }

    fun <T> discard(input: List<T>, predicate: (T) -> Boolean): List<T> = keep(input) { !predicate(it) }
}
class CustomSet(vararg elements: Int) {
    private val hashToElement = elements.associateBy { it.hashCode() }.toMutableMap()

    fun isEmpty(): Boolean = hashToElement.isEmpty()

    fun isSubset(other: CustomSet) = hashToElement.keys.all { it in other.hashToElement }

    fun isDisjoint(other: CustomSet) = hashToElement.keys.all { it !in other.hashToElement }

    fun contains(other: Int) = other.hashCode() in hashToElement

    fun add(other: Int) {
        hashToElement.putIfAbsent(other.hashCode(), other)
    }

    override fun equals(other: Any?) = when(other) {
        is CustomSet -> other.isSubset(this) && this.isSubset(other)
        else -> false
    }

    fun intersection(other: CustomSet) = CustomSet().also { newSet ->
        hashToElement.filter { it.key in other.hashToElement }.values.forEach { newSet.add(it) } }

    operator fun plus(other: CustomSet) = CustomSet().also { newSet ->
        hashToElement.values.forEach { newSet.add(it) }
        other.hashToElement.values.forEach { newSet.add(it) }
    }

    operator fun minus(other: CustomSet) = CustomSet().also { newSet ->
        hashToElement.filter { it.key !in other.hashToElement }.values.forEach { newSet.add(it) }
    }
}

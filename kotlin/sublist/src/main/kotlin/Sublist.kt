fun <T> List<T>.relationshipTo(other: List<T>) =
    when {
        this == other -> Relationship.EQUAL
        this.isSublistOf(other) -> Relationship.SUBLIST
        other.isSublistOf(this) -> Relationship.SUPERLIST
        else -> Relationship.UNEQUAL
    }

private fun <T> List<T>.isSublistOf(other: List<T>) =
    when {
        isEmpty() -> true
        size > other.size -> false
        else -> other.windowed(size).any { this == it }
    }
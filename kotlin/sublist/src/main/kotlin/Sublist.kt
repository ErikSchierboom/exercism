fun <T> List<T>.relationshipTo(other: List<T>) =
    when {
        size > other.size -> if (other sublistOf this) Relationship.SUPERLIST else Relationship.UNEQUAL
        size < other.size -> if (this sublistOf other) Relationship.SUBLIST else Relationship.UNEQUAL
        else -> if (this == other) Relationship.EQUAL else Relationship.UNEQUAL
    }

private infix fun <T> List<T>.sublistOf(other: List<T>) =
    when {
        isEmpty() -> true
        size > other.size -> false
        else -> other.windowed(size).any { this == it }
    }
fun <T> List<T>.relationshipTo(other: List<T>) =
        when {
            this.size > other.size -> if (other.isSublist(this)) Relationship.SUPERLIST else Relationship.UNEQUAL
            this.size < other.size -> if (this.isSublist(other)) Relationship.SUBLIST else Relationship.UNEQUAL
            else -> if (this == other) Relationship.EQUAL else Relationship.UNEQUAL
        }

private fun <T> List<T>.isSublist(other: List<T>): Boolean =
        when {
            this.isEmpty() -> true
            this.size > other.size -> false
            else -> (0..other.size - this.size).any { this == other.slice(it until it + this.size) }
        }
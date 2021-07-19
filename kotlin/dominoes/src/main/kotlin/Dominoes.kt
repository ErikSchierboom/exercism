class ChainNotFoundException(msg: String) : RuntimeException(msg)

data class Domino(val left: Int, val right: Int) {
    fun flip() = copy(left = right, right = left)
    fun chainsTo(other: Domino) = right == other.left
}

object Dominoes {
    fun formChain(vararg dominoes: Domino): List<Domino> = formChain(dominoes.toList())

    fun formChain(dominoes: List<Domino>): List<Domino> =
        if (dominoes.isEmpty()) dominoes else
            formChain(dominoes.take(1), dominoes.drop(1)) ?: throw ChainNotFoundException("Could not form chain")

    private fun formChain(chain: List<Domino>, unused: List<Domino>): List<Domino>? {
        if (unused.isEmpty()) return if (chain.last().chainsTo(chain.first())) chain else null

        return unused.rotations().mapNotNull {
            when {
                chain.last().chainsTo(it.first()) -> it
                chain.last().chainsTo(it.first().flip()) -> listOf(it.first().flip()) + it.drop(1)
                else -> null
            }
        }
            .mapNotNull { formChain(chain + it.take(1), it.drop(1)) }
            .firstOrNull()
    }

    private fun List<Domino>.rotations() = indices.map { drop(it) + take(it) }
}

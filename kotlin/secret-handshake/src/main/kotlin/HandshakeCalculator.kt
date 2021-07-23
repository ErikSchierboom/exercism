object HandshakeCalculator {
    private val operations: List<Pair<Int, (List<Signal>) -> List<Signal>>> = listOf(
        1 shl 0 to { it + Signal.WINK },
        1 shl 1 to { it + Signal.DOUBLE_BLINK },
        1 shl 2 to { it + Signal.CLOSE_YOUR_EYES },
        1 shl 3 to { it + Signal.JUMP },
        1 shl 4 to { it.reversed() }
    )

    fun calculateHandshake(code: Int): List<Signal> =
        operations.fold(emptyList()) { acc, op -> if (op.first.and(code) != 0) op.second(acc) else acc }
}
object HandshakeCalculator {
    private val operations = listOf<(List<Signal>) -> List<Signal>>(
        { it + Signal.WINK },
        { it + Signal.DOUBLE_BLINK },
        { it + Signal.CLOSE_YOUR_EYES },
        { it + Signal.JUMP },
        { it.reversed() }
    )

    fun calculateHandshake(code: Int) =
        operations.foldIndexed(emptyList<Signal>()) { leftShift, handshake, operation ->
            if (1.shl(leftShift).and(code) == 0) handshake else operation(handshake)
        }
}
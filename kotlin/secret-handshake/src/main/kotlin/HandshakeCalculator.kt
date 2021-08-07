object HandshakeCalculator {
    private val operations: List<(List<Signal>) -> List<Signal>> =
        Signal.values().map { { signals: List<Signal> -> signals + it } } + { it.reversed() }

    fun calculateHandshake(code: Int) =
        operations.foldIndexed(emptyList<Signal>()) { leftShift, handshake, operation ->
            if (1.shl(leftShift).and(code) == 0) handshake else operation(handshake)
        }
}
data class Operation(val mask: Int, val map: (List<Signal>) -> List<Signal>)

object HandshakeCalculator {
    private val operations = listOf(
        Operation(1 shl 0) { it + Signal.WINK },
        Operation(1 shl 1) { it + Signal.DOUBLE_BLINK },
        Operation(1 shl 2) { it + Signal.CLOSE_YOUR_EYES },
        Operation(1 shl 3) { it + Signal.JUMP },
        Operation(1 shl 4) { it.reversed() }
    )

    fun calculateHandshake(code: Int) =
        operations.fold(emptyList<Signal>()) { handshake, operation ->
            if (operation.mask.and(code) != 0) operation.map(handshake) else handshake
        }
}
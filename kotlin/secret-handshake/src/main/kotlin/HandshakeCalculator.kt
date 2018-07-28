object HandshakeCalculator {
    const val REVERSE_SIGNALS_MASK = 0b00010000

    fun calculateHandshake(encodedHandshake: Int): List<Signal> {
        val signals = Signal.values().filter { matchesMask(encodedHandshake, it.mask) }

        return if (reverseSignals(encodedHandshake)) signals.reversed() else signals
    }

    private fun reverseSignals(encodedHandshake: Int) = matchesMask(encodedHandshake, REVERSE_SIGNALS_MASK)

    private fun matchesMask(input: Int, mask: Int) = input.and(mask) == mask
}
object HandshakeCalculator {
    private const val REVERSE_SIGNALS_MASK = 0b00010000
    private val signals = Signal.values()

    fun calculateHandshake(encodedHandshake: Int): List<Signal> {
        val encodedSignals = signals.filter { matchesMask(encodedHandshake, signalMask(it) ) }

        return if (reverseSignals(encodedHandshake)) encodedSignals.reversed() else encodedSignals
    }

    private fun signalMask(signal: Signal) = 1 shl signals.indexOf(signal)

    private fun reverseSignals(encodedHandshake: Int) = matchesMask(encodedHandshake, REVERSE_SIGNALS_MASK)

    private fun matchesMask(input: Int, mask: Int) = input.and(mask) == mask
}
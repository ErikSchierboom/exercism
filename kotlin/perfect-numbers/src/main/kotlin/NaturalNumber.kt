enum class Classification {
    DEFICIENT, PERFECT, ABUNDANT
}

fun classify(naturalNumber: Int): Classification {
    require(naturalNumber > 0)

    return naturalNumber.sumOfFactors().let {
        when {
            it < naturalNumber -> Classification.DEFICIENT
            it == naturalNumber -> Classification.PERFECT
            else -> Classification.ABUNDANT
        }
    }
}

fun Int.sumOfFactors() = 1.until(this).filter { this % it == 0 }.sum()
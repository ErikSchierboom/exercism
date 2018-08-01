enum class Classification {
    DEFICIENT, PERFECT, ABUNDANT
}

private fun sumOfFactors(naturalNumber: Int) = (1 until naturalNumber).filter { naturalNumber % it == 0 }.sum()

fun classify(naturalNumber: Int): Classification {
    require(naturalNumber > 0)

    val sumOfFactorsForInput = sumOfFactors(naturalNumber)

    return when {
        sumOfFactorsForInput < naturalNumber -> Classification.DEFICIENT
        sumOfFactorsForInput == naturalNumber -> Classification.PERFECT
        else -> Classification.ABUNDANT
    }
}
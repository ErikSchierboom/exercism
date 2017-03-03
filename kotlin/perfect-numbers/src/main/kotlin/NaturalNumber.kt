enum class Classification {
    DEFICIENT, PERFECT, ABUNDANT
}

fun sumOfFactors(naturalNumber: Int): Int {
    var sumOfFactors = 0

    for (i in 1..naturalNumber - 1)
        if (naturalNumber % i === 0)
            sumOfFactors += i

    return sumOfFactors
}

fun classify(naturalNumber: Int): Classification {
    require(naturalNumber >= 0)

    var sumOfFactorsForInput = sumOfFactors(naturalNumber)

    if (sumOfFactorsForInput < naturalNumber)
        return Classification.DEFICIENT
    else if (sumOfFactorsForInput == naturalNumber)
        return Classification.PERFECT
    else
        return Classification.ABUNDANT
}

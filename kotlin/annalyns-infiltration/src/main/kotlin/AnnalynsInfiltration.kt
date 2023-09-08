fun canFastAttack(knightIsAwake: Boolean): Boolean {
    return !knightIsAwake
}

fun canSpy(
    knightIsAwake: Boolean,
    archerIsAwake: Boolean,
    prisonerIsAwake: Boolean
): Boolean {
    return prisonerIsAwake || knightIsAwake || archerIsAwake
}

fun canSignalPrisoner(archerIsAwake: Boolean, prisonerIsAwake: Boolean): Boolean {
    return prisonerIsAwake && !archerIsAwake
}

fun canFreePrisoner(
    knightIsAwake: Boolean,
    archerIsAwake: Boolean,
    prisonerIsAwake: Boolean,
    petDogIsPresent: Boolean
): Boolean {
    return petDogIsPresent && !archerIsAwake || prisonerIsAwake && !knightIsAwake && !archerIsAwake
}

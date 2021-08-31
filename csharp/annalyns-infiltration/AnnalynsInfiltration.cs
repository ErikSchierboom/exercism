using System;

static class QuestLogic
{
    public static bool CanFastAttack(bool knightIsAwake) =>
        !knightIsAwake;

    public static bool CanSpy(bool knightIsAwake, bool archerIsAwake, bool prisonerIsAwake) =>
        prisonerIsAwake || knightIsAwake || archerIsAwake;

    public static bool CanSignalPrisoner(bool archerIsAwake, bool prisonerIsAwake) =>
        prisonerIsAwake && !archerIsAwake;

    public static bool CanFreePrisoner(bool knightIsAwake, bool archerIsAwake, bool prisonerIsAwake, bool petDogIsPresent) =>
        prisonerIsAwake && !knightIsAwake && !archerIsAwake ||
        petDogIsPresent && !archerIsAwake;
}

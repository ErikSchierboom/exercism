module AnnalynsInfiltration

let canFastAttack knightIsAwake = not knightIsAwake

let canSpy knightIsAwake archerIsAwake prisonerIsAwake =
  knightIsAwake || archerIsAwake || prisonerIsAwake

let canSignalPrisoner archerIsAwake prisonerIsAwake =
   prisonerIsAwake && not archerIsAwake 

let canFreePrisoner knightIsAwake archerIsAwake prisonerIsAwake petDogIsPresent =
   prisonerIsAwake && not knightIsAwake && not archerIsAwake ||
   petDogIsPresent && not archerIsAwake

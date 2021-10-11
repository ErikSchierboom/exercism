module BirdWatcher

let lastWeek = [| 0; 2; 5; 3; 7; 8; 4 |]

let yesterday (counts: int[]) = counts.[^1]

let total (counts: int[]) = Array.sum counts

let dayWithoutBirds counts = Array.contains 0 counts

let incrementTodaysCount(counts: int[]): int[] =
  counts.[^0] <- counts.[^0] + 1
  counts

let oddWeek counts = counts = [| 1; 0; 1; 0; 1; 0; 1 |]

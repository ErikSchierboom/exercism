# Split-Second Stopwatch

Welcome to Split-Second Stopwatch on Exercism's C# Track.
If you need help running the tests or submitting your code, check out `HELP.md`.

## Introduction

You've always run for the thrill of it — no schedules, no timers, just the sound of your feet on the pavement.
But now that you've joined a competitive running crew, things are getting serious.
Training sessions are timed to the second, and every split second counts.
To keep pace, you've picked up the _Split-Second Stopwatch_ — a sleek, high-tech gadget that's about to become your new best friend.

## Instructions

Your task is to build a stopwatch to keep precise track of lap times.

The stopwatch uses four commands (start, stop, lap, and reset) to keep track of:

1. The current lap's tracked time
2. Previously recorded lap times

What commands can be used depends on which state the stopwatch is in:

1. Ready: initial state
2. Running: tracking time
3. Stopped: not tracking time

| Command | Begin state | End state | Effect                                                   |
| ------- | ----------- | --------- | -------------------------------------------------------- |
| Start   | Ready       | Running   | Start tracking time                                      |
| Start   | Stopped     | Running   | Resume tracking time                                     |
| Stop    | Running     | Stopped   | Stop tracking time                                       |
| Lap     | Running     | Running   | Add current lap to previous laps, then reset current lap |
| Reset   | Stopped     | Ready     | Reset current lap and clear previous laps                |

## Source

### Created by

- @erikschierboom

### Based on

Erik Schierboom - https://github.com/exercism/problem-specifications/pull/2547
# Robot Simulator

Welcome to Robot Simulator on Exercism's R Track.
If you need help running the tests or submitting your code, check out `HELP.md`.

## Instructions

Write a robot simulator.

A robot factory's test facility needs a program to verify robot movements.

The robots have three possible movements:

- turn right
- turn left
- advance

Robots are placed on a hypothetical infinite grid, facing a particular direction (north, east, south, or west) at a set of {x,y} coordinates,
e.g., {3,8}, with coordinates increasing to the north and east.

The robot then receives a number of instructions, at which point the testing facility verifies the robot's new position, and in which direction it is pointing.

- The letter-string "RAALAL" means:
  - Turn right
  - Advance twice
  - Turn left
  - Advance once
  - Turn left yet again
- Say a robot starts at {7, 3} facing north.
  Then running this stream of instructions should leave it at {9, 4} facing west.

## Hint

For this exercise you will need to implement a simple S3 class via its constructor, generic method and dispatch to class method. If you are not familiar with S3, a great starting point is the [chapter on S3](http://adv-r.hadley.nz/s3.html) in Hadley Wickham's book Advanced R.

## Source

### Created by

- @Nerwosolek

### Based on

Inspired by an interview question at a famous company.
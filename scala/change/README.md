# Change

Write a program that will correctly determine change to be given using the least number of coins

Write a program that will correctly determine the fewest number of coins
to be given to the user such that the sum of the coins' value would
equal the correct amount of change.

## For example

- An input of 15 with [1, 5, 10, 25, 100] should return one nickel (5)
  and one dime (10) or [0, 1, 1, 0, 0]
- An input of 40 with [1, 5, 10, 25, 100] should return one nickel (5)
  and one dime (10) and one quarter (25) or [0, 1, 1, 1, 0]

## Edge cases

- Does your algorithm work for any given set of coins?
- Can you ask for negative change?
- Can you ask for a change value smaller than the smallest coin value?

The Scala exercises assume an SBT project scheme. The exercise solution source
should be placed within the exercise directory/src/main/scala. The exercise
unit tests can be found within the exercise directory/src/test/scala.

To run the tests simply run the command `sbt test` in the exercise directory.

For more detailed info about the Scala track see the [help
page](http://exercism.io/languages/scala).

## Source

Software Craftsmanship - Kata-logue [http://craftsmanship.sv.cmu.edu/exercises/coin-change-kata](http://craftsmanship.sv.cmu.edu/exercises/coin-change-kata)

## Submitting Incomplete Problems
It's possible to submit an incomplete solution so you can see how others have completed the exercise.


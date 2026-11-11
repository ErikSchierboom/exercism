# Baffling Birthdays

Welcome to Baffling Birthdays on Exercism's Julia Track.
If you need help running the tests or submitting your code, check out `HELP.md`.
If you get stuck on the exercise, check out `HINTS.md`, but try and solve it without using those first :)

## Introduction

Fresh out of college, you're throwing a huge party to celebrate with friends and family.
Over 70 people have shown up, including your mildly eccentric Uncle Ted.

In one of his usual antics, he bets you £100 that at least two people in the room share the same birthday.
That sounds ridiculous — there are many more possible birthdays than there are guests, so you confidently accept.

To your astonishment, after collecting the birthdays of just 32 guests, you've already found two guests that share the same birthday.
Accepting your loss, you hand Uncle Ted his £100, but something feels off.

The next day, curiosity gets the better of you.
A quick web search leads you to the [birthday paradox][birthday-problem], which reveals that with just 23 people, the probability of a shared birthday exceeds 50%.

Ah. So _that's_ why Uncle Ted was so confident.

Determined to turn the tables, you start looking up other paradoxes; next time, _you'll_ be the one making the bets.

~~~~exercism/note
The birthday paradox is a [veridical paradox][veridical-paradox]: even though it feels wrong, it is actually true.

[veridical-paradox]: https://en.wikipedia.org/wiki/Paradox#Quine's_classification
~~~~

[birthday-problem]: https://en.wikipedia.org/wiki/Birthday_problem

## Instructions

Your task is to estimate the birthday paradox's probabilities.

To do this, you need to:

- Generate random birthdates.
- Check if a collection of randomly generated birthdates contains at least two with the same birthday.
- Estimate the probability that at least two people in a group share the same birthday for different group sizes.

~~~~exercism/note
A birthdate includes the full date of birth (year, month, and day), whereas a birthday refers only to the month and day, which repeat each year.
Two birthdates with the same month and day correspond to the same birthday.
~~~~

~~~~exercism/caution
The birthday paradox assumes that:

- There are 365 possible birthdays (no leap years).
- Each birthday is equally likely (uniform distribution).

Your implementation must follow these assumptions.
~~~~

## Source

### Created by

- @colinleach

### Based on

Erik Schierboom - https://github.com/exercism/problem-specifications/pull/2539
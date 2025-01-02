# Change

Welcome to Change on Exercism's Uiua Track.
If you need help running the tests or submitting your code, check out `HELP.md`.

## Introduction

In the mystical village of Coinholt, you stand behind the counter of your bakery, arranging a fresh batch of pastries.
The door creaks open, and in walks Denara, a skilled merchant with a keen eye for quality goods.
After a quick meal, she slides a shimmering coin across the counter, representing a value of 100 units.

You smile, taking the coin, and glance at the total cost of the meal: 88 units.
That means you need to return 12 units in change.

Denara holds out her hand expectantly.
"Just give me the fewest coins," she says with a smile.
"My pouch is already full, and I don't want to risk losing them on the road."

You know you have a few options.
"We have Lumis (worth 10 units), Viras (worth 5 units), and Zenth (worth 2 units) available for change."

You quickly calculate the possibilities in your head:

- one Lumis (1 × 10 units) + one Zenth (1 × 2 units) = 2 coins total
- two Viras (2 × 5 units) + one Zenth (1 × 2 units) = 3 coins total
- six Zenth (6 × 2 units) = 6 coins total

"The best choice is two coins: one Lumis and one Zenth," you say, handing her the change.

Denara smiles, clearly impressed.
"As always, you've got it right."

## Instructions

Determine the fewest number of coins to give a customer so that the sum of their values equals the correct amount of change.

## Examples

- An amount of 15 with available coin values [1, 5, 10, 25, 100] should return one coin of value 5 and one coin of value 10, or [5, 10].
- An amount of 40 with available coin values [1, 5, 10, 25, 100] should return one coin of value 5, one coin of value 10, and one coin of value 25, or [5, 10, 25].

## Source

### Created by

- @erikschierboom

### Based on

Software Craftsmanship - Coin Change Kata - https://web.archive.org/web/20130115115225/http://craftsmanship.sv.cmu.edu:80/exercises/coin-change-kata
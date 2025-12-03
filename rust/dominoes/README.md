# Dominoes

Welcome to Dominoes on Exercism's Rust Track.
If you need help running the tests or submitting your code, check out `HELP.md`.

## Introduction

In Toyland, the trains are always busy delivering treasures across the city, from shiny marbles to rare building blocks.
The tracks they run on are made of colorful domino-shaped pieces, each marked with two numbers.
For the trains to move, the dominoes must form a perfect chain where the numbers match.

Today, an urgent delivery of rare toys is on hold.
You've been handed a set of track pieces to inspect.
If they can form a continuous chain, the train will be on its way, bringing smiles across Toyland.
If not, the set will be discarded, and another will be tried.

The toys are counting on you to solve this puzzle.
Will the dominoes connect the tracks and send the train rolling, or will the set be left behind?

## Instructions

Make a chain of dominoes.

Compute a way to order a given set of domino stones so that they form a correct domino chain.
In the chain, the dots on one half of a stone must match the dots on the neighboring half of an adjacent stone.
Additionally, the dots on the halves of the stones without neighbors (the first and last stone) must match each other.

For example given the stones `[2|1]`, `[2|3]` and `[1|3]` you should compute something
like `[1|2] [2|3] [3|1]` or `[3|2] [2|1] [1|3]` or `[1|3] [3|2] [2|1]` etc, where the first and last numbers are the same.

For stones `[1|2]`, `[4|1]` and `[2|3]` the resulting chain is not valid: `[4|1] [1|2] [2|3]`'s first and last numbers are not the same.
4 != 3

Some test cases may use duplicate stones in a chain solution, assume that multiple Domino sets are being used.

## Source

### Created by

- @EduardoBautista

### Contributed to by

- @andrewclarkson
- @AndrewKvalheim
- @ashleygwilliams
- @ClashTheBunny
- @cmccandless
- @coriolinus
- @cwhakes
- @EduardoBautista
- @efx
- @ErikSchierboom
- @etrepum
- @IanWhitney
- @kytrinyx
- @lutostag
- @mkantor
- @nfiles
- @petertseng
- @rofrol
- @stringparser
- @xakon
- @ZapAnton
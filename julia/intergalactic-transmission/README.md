# Intergalactic Transmission

Welcome to Intergalactic Transmission on Exercism's Julia Track.
If you need help running the tests or submitting your code, check out `HELP.md`.
If you get stuck on the exercise, check out `HINTS.md`, but try and solve it without using those first :)

## Introduction

Trillions upon trillions of messages zip between Earth and neighboring galaxies every millisecond.
But transmitting over such long distances is tricky.
Pesky solar flares, temporal distortions, stray forces, and even the flap of a space butterfly's wing can cause a random bit to change during transmission.

Now imagine the consequences:

- Crashing the Intergalactic Share Market when "buy low" turns to "sell now".
- Losing contact with the Kepler Whirl system when "save new worm hole" becomes "cave new worm hole".
- Or plunging the universe into existential horror by replacing a cowboy emoji 🤠 with a clown emoji 🤡.

Detecting corrupted messages isn't just important — it's critical.
The receiver _must_ know when something has gone wrong before disaster strikes.

But how?
Scientists and engineers from across the universe have been battling this problem for eons.
Entire cosmic AI superclusters churn through the data.
And then, one day, a legend resurfaces — an ancient, powerful method, whispered in debugging forums, muttered by engineers who've seen too much...

The Parity Bit!

A method so simple, so powerful, that it might just save interstellar communication.

## Instructions

Your job is to help implement

- the transmitter, which calculates the transmission sequence, and
- the receiver, which decodes it.

A parity bit is simple way of detecting transmission errors.
The transmitters and receivers can only transmit and receive _exactly_ eight bits at a time (including the parity bit).
The parity bit is set so that there is an _even_ number of 1 bits in each transmission, and the parity bit is always the first bit from the right.
So if the receiver receives `11000001`, `01110101` or `01000000` (i.e. a transmission with an odd number of 1 bits), it knows there is an error.

However, messages are rarely this short, and need to be transmitted in a sequence when they are longer.

For example, consider the message `11000000 00000001 11000000 11011110` (or `C0 01 C0 DE` in hex).

Since each transmission contains exactly eight bits, it can only contain seven bits of data and the parity bit.
A parity bit must then be inserted after every seven bits of data:

```text
11000000 00000001 11000000 11011110
      ↑       ↑       ↑       ↑          (7th bits)
```

The transmission sequence for this message looks like this:

```text
1100000_ 0000000_ 0111000_ 0001101_ 1110
       ↑        ↑        ↑        ↑      (parity bits)
```

The data in the first transmission in the sequence (`1100000`) has two 1 bits (an even number), so the parity bit is 0.
The first transmission becomes `11000000` (or `C0` in hex).

The data in the next transmission (`0000000`) has zero 1 bits (an even number again), so the parity bit is 0 again.
The second transmission thus becomes `00000000` (or `00` in hex).

The data for the next two transmissions (`0111000` and `0001101`) have three 1 bits.
Their parity bits are set to 1 so that they have an even number of 1 bits in the transmission.
They are transmitted as `01110001` and `00011011` (or `71` and `1B` in hex).

The last transmission (`1110`) has only four bits of data.
Since exactly eight bits are transmitted at a time and the parity bit is the rightmost bit, three 0 bits and then the parity bit are added to make up eight bits.
It now looks like this (where `_` is the parity bit):

```text
1110 000_
     ↑↑↑   (added 0 bits)
```

There is an odd number of 1 bits again, so the parity bit is 1.
The last transmission in the sequence becomes `11100001` (or `E1` in hex).

The entire transmission sequence for this message is `11000000 00000000 01110001 00011011 11100001` (or `C0 00 71 1B E1` in hex).

## Source

### Created by

- @colinleach

### Based on

Kah Goh - https://github.com/exercism/problem-specifications/pull/2543
# Secret Handshake

Welcome to Secret Handshake on Exercism's Elixir Track.
If you need help running the tests or submitting your code, check out `HELP.md`.
If you get stuck on the exercise, check out `HINTS.md`, but try and solve it without using those first :)

## Instructions

> There are 10 types of people in the world: Those who understand
> binary, and those who don't.

You and your fellow cohort of those in the "know" when it comes to
binary decide to come up with a secret "handshake".

```text
00001 = wink
00010 = double blink
00100 = close your eyes
01000 = jump


10000 = Reverse the order of the operations in the secret handshake.
```

Given a decimal number, convert it to the appropriate sequence of events for a secret handshake.

Here's a couple of examples:

Given the decimal input 3, the function would return the array
["wink", "double blink"] because the decimal number 3 is 2+1 in powers of two and thus `11` in binary.

Let's now examine the input 19 which is 16+2+1 in powers of two and thus `10011` in binary.
Recalling that the addition of 16 (`10000` in binary) reverses an array and that we already know what array is returned given input 3, the array returned for input 19 is ["double blink", "wink"].

## Source

### Created by

- @DoggettCK

### Contributed to by

- @angelikatyborska
- @Cohen-Carlisle
- @devonestes
- @mlopes
- @neenjaw
- @sotojuan

### Based on

Bert, in Mary Poppins - http://www.imdb.com/title/tt0058331/quotes/qt0437047
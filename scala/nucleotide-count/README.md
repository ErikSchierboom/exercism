# Nucleotide Count

Welcome to Nucleotide Count on Exercism's Scala Track.
If you need help running the tests or submitting your code, check out `HELP.md`.

## Instructions

Each of us inherits from our biological parents a set of chemical instructions known as DNA that influence how our bodies are constructed. All known life depends on DNA!

> Note: You do not need to understand anything about nucleotides or DNA to complete this exercise.

DNA is a long chain of other chemicals and the most important are the four nucleotides, adenine, cytosine, guanine and thymine. A single DNA chain can contain billions of these four nucleotides and the order in which they occur is important!
We call the order of these nucleotides in a bit of DNA a "DNA sequence".

We represent a DNA sequence as an ordered collection of these four nucleotides and a common way to do that is with a string of characters such as "ATTACG" for a DNA sequence of 6 nucleotides.
'A' for adenine, 'C' for cytosine, 'G' for guanine, and 'T' for thymine.

Given a string representing a DNA sequence, count how many of each nucleotide is present.
If the string contains characters that aren't A, C, G, or T then it is invalid and you should signal an error.

For example:

```
"GATTACA" -> 'A': 3, 'C': 1, 'G': 1, 'T': 2
"INVALID" -> error
```

A common use of `Either` is to indicate a computation that may possibly result in an error
(if the actual error is of no interest then the simpler `Option` type might be a better choice).
In the absence of an error the result is usually a `Right` (mnemonic: the "right" value)
whereas an error is a `Left`, for example a `Left[String]` containing an error message.
Note that in Scala 2.12 `Either` is right-biased by default, so it works as expected for operations like `filter`, `map`, `flatMap` or in a for-comprehension.
If you are unfamiliar with `Either` you may read [this tutorial](http://danielwestheide.com/blog/2013/01/02/the-neophytes-guide-to-scala-part-7-the-either-type.html). But be aware that this tutorial is about Scala versions prior to 2.12. For Scala 2.12 you can safely ignore `RightProjection` and omit `.right`.
`Either` is a so-called [Monad](https://en.wikipedia.org/wiki/Monad_(functional_programming)) which covers a "computational aspect",
in this case error handling.
Proper use of Monads can result in very concise yet elegant
and readable code. Improper use can easily result in the contrary.
Watch [this video](https://www.youtube.com/watch?v=Mw_Jnn_Y5iA) to learn more.
## Common pitfalls that you should avoid
There are a few rules of thumbs for `Either`:
1. If you don't need it don't use it. Instead of
```scala
def add1(x: Int): Either[String, Int] = Right(x + 1)
```
better have
```scala
def add1(x: Int): Int = x + 1
```
(there is `Either.map` to apply such simple functions,
so you don't have to clutter them with `Either`).
2. Don't "unwrap" if you don't really need to.
Often there are built-in functions for your purpose. Indicators of premature
unwrapping are `isLeft/isRight` or pattern matching. For example, instead of
```scala
val x: Either[String, Int] = ...

if (x.isRight) x.right.get + 1 else x.left.get
// or
x match {
  case Right(n) => n + 1
  case Left(s) => s
}
```
better have
```scala
x fold (identity, _ + 1)
```
3. Monads can be used inside a for-comprehension FTW.
This is advisable when you want to "compose" several `Either` instances. Instead of
```scala
val xo: Either[String, Int] = ...
val yo: Either[String, Int] = ...
val zo: Either[String, Int] = ...

xo.flatMap(x =>
  yo.flatMap(y =>
    zo.map(z =>
	    x + y + z)))
```
better have
```scala
for {
  x <- xo
  y <- yo
  z <- zo
} yield x + y + z
```

## Source

### Created by

- @sgrif

### Contributed to by

- @abo64
- @astradamus
- @ErikSchierboom
- @kytrinyx
- @ppartarr
- @rajeshpg
- @ricemery
- @sjakobi

### Based on

The Calculating DNA Nucleotides_problem at Rosalind - http://rosalind.info/problems/dna/
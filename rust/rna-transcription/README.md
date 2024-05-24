# RNA Transcription

Welcome to RNA Transcription on Exercism's Rust Track.
If you need help running the tests or submitting your code, check out `HELP.md`.

## Introduction

You work for a bioengineering company that specializes in developing therapeutic solutions.

Your team has just been given a new project to develop a targeted therapy for a rare type of cancer.

~~~~exercism/note
It's all very complicated, but the basic idea is that sometimes people's bodies produce too much of a given protein.
That can cause all sorts of havoc.

But if you can create a very specific molecule (called a micro-RNA), it can prevent the protein from being produced.

This technique is called [RNA Interference][rnai].

[rnai]: https://admin.acceleratingscience.com/ask-a-scientist/what-is-rnai/
~~~~

## Instructions

Your task is determine the RNA complement of a given DNA sequence.

Both DNA and RNA strands are a sequence of nucleotides.

The four nucleotides found in DNA are adenine (**A**), cytosine (**C**), guanine (**G**) and thymine (**T**).

The four nucleotides found in RNA are adenine (**A**), cytosine (**C**), guanine (**G**) and uracil (**U**).

Given a DNA strand, its transcribed RNA strand is formed by replacing each nucleotide with its complement:

- `G` -> `C`
- `C` -> `G`
- `T` -> `A`
- `A` -> `U`

~~~~exercism/note
If you want to look at how the inputs and outputs are structured, take a look at the examples in the test suite.
~~~~

## Notes on Rust implementation

By using private fields in structs with public `new` functions returning
`Option` or `Result` (as here with `DNA::new` & `RNA::new`), we can guarantee
that the internal representation of `DNA` is correct. Because every valid DNA
string has a valid RNA string, we don't need to return a `Result`/`Option` from
`into_rna`.

This explains the type signatures you will see in the tests.

The return types of both `DNA::new()` and `RNA::new()` are `Result<Self, usize>`,
where the error type `usize` represents the index of the first invalid character
(char index, not utf8).

## Source

### Created by

- @EduardoBautista

### Contributed to by

- @andrewclarkson
- @AndrewKvalheim
- @ashleygwilliams
- @benreyn
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
- @pminten
- @rofrol
- @rpottsoh
- @samcday
- @shingtaklam1324
- @stringparser
- @TheDarkula
- @xakon
- @ZapAnton

### Based on

Hyperphysics - https://web.archive.org/web/20220408112140/http://hyperphysics.phy-astr.gsu.edu/hbase/Organic/transcription.html
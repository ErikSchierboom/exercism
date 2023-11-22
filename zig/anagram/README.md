# Anagram

Welcome to Anagram on Exercism's Zig Track.
If you need help running the tests or submitting your code, check out `HELP.md`.

## Instructions

An anagram is a rearrangement of letters to form a new word: for example `"owns"` is an anagram of `"snow"`.
A word is not its own anagram: for example, `"stop"` is not an anagram of `"stop"`.

Given a target word and a set of candidate words, this exercise requests the anagram set: the subset of the candidates that are anagrams of the target.

The target and candidates are words of one or more ASCII alphabetic characters (`A`-`Z` and `a`-`z`).
Lowercase and uppercase characters are equivalent: for example, `"PoTS"` is an anagram of `"sTOp"`, but `StoP` is not an anagram of `sTOp`.
The anagram set is the subset of the candidate set that are anagrams of the target (in any order).
Words in the anagram set should have the same letter case as in the candidate set.

Given the target `"stone"` and candidates `"stone"`, `"tones"`, `"banana"`, `"tons"`, `"notes"`, `"Seton"`, the anagram set is `"tones"`, `"notes"`, `"Seton"`.

## BufSet

We suggest that `detectAnagrams` returns a `BufSet`.

A `BufSet` is a set of strings, the same as `StringHashMap(void)`, except that you don't need to copy a key before inserting.
The `BufSet` does that itself.

For more details on hash maps in Zig, see:

- [Hexops - Zig hashmaps explained][zig-hashmaps-explained]
- [Zighelp - Hash Maps][zighelp]
- [Zig Standard Library - `buf_set.zig`][buf-set]

[buf-set]: https://github.com/ziglang/zig/blob/0.11.0/lib/std/buf_set.zig
[zig-hashmaps-explained]: https://devlog.hexops.com/2022/zig-hashmaps-explained/
[zighelp]: https://zighelp.org/chapter-2/#hash-maps

## Source

### Created by

- @ee7

### Based on

Inspired by the Extreme Startup game - https://github.com/rchatley/extreme_startup
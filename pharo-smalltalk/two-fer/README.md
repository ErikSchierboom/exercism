# Two Fer

Welcome to Two Fer on Exercism's Pharo Track.
If you need help running the tests or submitting your code, check out `HELP.md`.

## Introduction

In some English accents, when you say "two for" quickly, it sounds like "two fer".
Two-for-one is a way of saying that if you buy one, you also get one for free.
So the phrase "two-fer" often implies a two-for-one offer.

Imagine a bakery that has a holiday offer where you can buy two cookies for the price of one ("two-fer one!").
You go for the offer and (very generously) decide to give the extra cookie to a friend.

## Instructions

Your task is to determine what you will say as you give away the extra cookie.

If your friend likes cookies, and is named Do-yun, then you will say:

```text
One for Do-yun, one for me.
```

If your friend doesn't like cookies, you give the cookie to the next person in line at the bakery.
Since you don't know their name, you will say _you_ instead.

```text
One for you, one for me.
```

Here are some examples:

| Name   | Dialogue                    |
| :----- | :-------------------------- |
| Alice  | One for Alice, one for me.  |
| Bohdan | One for Bohdan, one for me. |
|        | One for you, one for me.    |
| Zaphod | One for Zaphod, one for me. |

In Pharo, classes are objects that can have instance and class methods, however unlike HelloWorld the tests for TwoFer have been written to call instance methods. Typically class methods are used for constructing new objects (like a contructor in other languages).While referring to methods, its useful to know that a method which has no parameters, is called a unary method, and a method taking multiple parameters, each deliniated by a word ending with a ':', is called a keyword method.There is also a third type of method, binary, which takes only 1 parameter and uses a symbol(s) for a name (typically a mathematical one like: +, -, & etc).

## Source

### Created by

- @macta

### Contributed to by

- @bencoman

### Based on

https://github.com/exercism/problem-specifications/issues/757
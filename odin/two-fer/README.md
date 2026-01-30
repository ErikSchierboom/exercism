# Two Fer

Welcome to Two Fer on Exercism's Odin Track.
If you need help running the tests or submitting your code, check out `HELP.md`.

## Introduction

In some English accents, when you say "two for" quickly, it sounds like "two fer".
Two-for-one is a way of saying that if you buy one, you also get one for free.
So the phrase "two-fer" often implies a two-for-one offer.

Imagine a bakery that has a holiday offer where you can buy two cookies for the price of one ("two-fer one!").
You take the offer and (very generously) decide to give the extra cookie to someone else in the queue.

## Instructions

Your task is to determine what you will say as you give away the extra cookie.

If you know the person's name (e.g. if they're named Do-yun), then you will say:

```text
One for Do-yun, one for me.
```

If you don't know the person's name, you will say _you_ instead.

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

## Odin-specific instructions

Odin supports default arguments.
Default arguments is a useful feature that allows a procedure to be called with different sets of parameters for use cases where you need related but different APIs.

Without default arguments, you could end-up with an explosion of the number of procedures required for your API.
Languages that don't support default arguments, like Java, rely on method overloading to achieve the same effect (with more code) or have to provide procedures with, potentially, a large set of arguments.

Let's take the example of a `greeting` procedure where we want to be able to specify the language, if the name is in uppercase, and if we should include an exclamation point at the end of the greeting.
After some analysis, we found that the largest group of users specify English as the language, do not uppercase the name, and don't want an exclamation point at the end, the second largest group add an exclamation point at the end of the greeting.

We could produce a single procedure with all the arguments:

```odin
greeting :: proc(name: string, language: Language, do_uppercase: bool, add_exclamation: bool) {
	...
}
```

This would force all users to read the documentation for all the arguments and always populate them.

Without default arguments, we could also define multiple procedures with different sets of parameters:

```odin
greeting_common :: proc(name: string) {...}

greeting_with_exclamation :: proc(name: string) {...}

greeting_general :: proc(name: string, language: Language, do_uppercase: bool, add_exclamation: bool) {...}

// Odin supports overloading but it has to be explicitly defined
greeting :: proc {
	greeting_common,
	greeting_with_exclamation,
	greeting_general,
}
```

If your language supports default arguments, like Odin does, you can just provide sensible defaults to the least used arguments.
Callers can skip the default arguments, causing the procedure to use the provided defaults, or override them.

```odin
greeting :: proc(name: string, language: Language = Language.English, do_uppercase : bool = false, add_exclamation: bool = false) {...}

// Note: because Odin supports type inference, we can simplify the interface.
greeting :: proc(name: string, language:= Language.English, do_uppercase := false, add_exclamation:= false) {...}
```

The procedure can be called with all defaulted arguments:

```odin
greeting("John Doe")
```

Arguments important to the caller can be overwritten:

```odin
greeting("John Doe", Language.Spanish)
```

If the arguments you need are in positional order, like in the example above, there is no need to name them as in the example above, but if you need to skip some, then you have to name the arguments after the first one you skipped.

```odin
greeting("John Doe", add_exclamation=true)
```

---

You may also be interested in the official Odin documentation about [default arguments][default-values] and Odin [named arguments][named-arguments].

[named-arguments]: https://odin-lang.org/docs/overview/#named-arguments
[default-values]: https://odin-lang.org/docs/overview/#default-values

## Source

### Created by

- @BNAndras

### Based on

https://github.com/exercism/problem-specifications/issues/757
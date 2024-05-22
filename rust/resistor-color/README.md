# Resistor Color

Welcome to Resistor Color on Exercism's Rust Track.
If you need help running the tests or submitting your code, check out `HELP.md`.
If you get stuck on the exercise, check out `HINTS.md`, but try and solve it without using those first :)

## Introduction

Most programs have dependencies on some libraries. Managing those by hand can be a pain. Luckily, the Rust ecosystem comes standard with `cargo`! `cargo` can manage dependencies for a project.

You will often see external packages being referred to as "crates" in Rust. A crate is a compilation unit in Rust. A crate can be compiled into a binary or into a library.

Most of the time, adding an external dependency is as simple as adding a line to your `Cargo.toml` file.

In this exercise, [`enum-iterator`](https://docs.rs/enum-iterator/1.2.0/enum_iterator/) and [`int-enum`](https://docs.rs/int-enum/0.5.0/int_enum/) dependencies were added for you.

## Instructions

If you want to build something using a Raspberry Pi, you'll probably use _resistors_.
For this exercise, you need to know two things about them:

- Each resistor has a resistance value.
- Resistors are small - so small in fact that if you printed the resistance value on them, it would be hard to read.

To get around this problem, manufacturers print color-coded bands onto the resistors to denote their resistance values.
Each band has a position and a numeric value.

The first 2 bands of a resistor have a simple encoding scheme: each color maps to a single number.

In this exercise you are going to create a helpful program so that you don't have to remember the values of the bands.

These colors are encoded as follows:

- Black: 0
- Brown: 1
- Red: 2
- Orange: 3
- Yellow: 4
- Green: 5
- Blue: 6
- Violet: 7
- Grey: 8
- White: 9

The goal of this exercise is to create a way to:
1. look up the numerical value associated with a particular color band
2. convert the numerical value into a string representing color
3. list the different band colors

For task number one, you will need the external crate [`int-enum`](https://docs.rs/int-enum/0.5.0/int_enum/) and for task number three, you'll need [`enum-iterator`](https://docs.rs/enum-iterator/1.2.0/enum_iterator/).
They're both already included in this exercise's `Cargo.toml`.
Be sure to check the crates' documentation to learn how to use them.
You can look into the default implementation of the Debug trait for Enums to complete task number two.

Mnemonics map the colors to the numbers, that, when stored as an array, happen to map to their index in the array: Better Be Right Or Your Great Big Values Go Wrong.

More information on the color encoding of resistors can be found in the [Electronic color code Wikipedia article](https://en.wikipedia.org/wiki/Electronic_color_code)

## Source

### Created by

- @still-flow
- @coriolinus

### Based on

Maud de Vries, Erik Schierboom - https://github.com/exercism/problem-specifications/issues/1458
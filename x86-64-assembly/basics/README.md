# Basics

Welcome to Basics on Exercism's x86-64 Assembly Track.
If you need help running the tests or submitting your code, check out `HELP.md`.
If you get stuck on the exercise, check out `HINTS.md`, but try and solve it without using those first :)

## Introduction

x86-64 assembly is a low-level language. In assembly there are no variables,
instead we use registers to store values. Some registers have a special purpose
such as returning a value from a function, or passing function arguments. To
store a value in a register, we use the `mov` instruction:

```nasm
mov rax, 42  ; rax = 42
```

An assembly program is divided into sections. The text section holds the
executable instructions of a program and is declared as follows:

```nasm
section .text
```

A function is a set of instructions that perform a specific task. A function
declaration consists of a label with the name of the function, the instructions
that define the function, and the return instruction. The following declares a
function called `foo`, which returns the value 42:

```nasm
foo:
  mov rax, 42
  ret
```

The value in the `rax` register specifies the value returned by the function.

To change the visibility of a function, and be able to call it from any file in
our program we use the `global` directive:

```nasm
global foo
```

When a function is called, the first argument is stored in the `rdi` register,
and the second argument is stored in the `rsi` register. Here's an example of a
function that takes a single argument and returns it, also known as an identity
function:

```nasm
global identity
identity:
  mov rax, rdi
  ret
```

For the arithmetic operations addition, subtraction, and multiplication, we can
use the `add`, `sub`, and `imul` instructions. They take two operands, a source
operand (first operand), and a destination operand (second operand), performs
the arithmetic operation, and stores the result in the destination operand.
Here's an example of a function that takes two arguments, adds them together,
and returns the result:

```nasm
global sum
sum:
  mov rax, rdi
  add rax, rsi  ; rax += rsi
  ret
```

To call a function, we use the `call` instruction. For example, to call our
`sum` function with the arguments 3 and 5, we would do the following:

```nasm
mov rdi, 3  ; First argument in rdi
mov rsi, 5  ; Second argument in rsi
call sum
; The rax register now contains the value 8
```

## Instructions

In this exercise you're going to write some code to help you cook a brilliant lasagna from your favorite cooking book.

You have four tasks, all related to the time spent cooking the lasagna.

## 1. Define the expected oven time in minutes

Define the `expected_minutes_in_oven()` function that does not take any parameters and returns how many minutes the lasagna should be in the oven. According to the cooking book, the expected oven time in minutes is 40:

```c
expected_minutes_in_oven();
// => 40
```

## 2. Calculate the remaining oven time in minutes

Define the `remaining_minutes_in_oven()` function that takes the actual minutes the lasagna has been in the oven as a parameter and returns how many minutes the lasagna still has to remain in the oven, based on the expected oven time in minutes from the previous task.

```c
remaining_minutes_in_oven(30);
// => 10
```

## 3. Calculate the preparation time in minutes

Define the `preparation_time_in_minutes()` function that takes the number of layers you added to the lasagna as a parameter and returns how many minutes you spent preparing the lasagna, assuming each layer takes you 2 minutes to prepare.

```c
preparation_time_in_minutes(2);
// => 4
```

## 4. Calculate the elapsed time in minutes

Define the `elapsed_time_in_minutes()` function that takes two parameters: the first parameter is the number of layers you added to the lasagna, and the second parameter is the number of minutes the lasagna has been in the oven. The function should return how many minutes you've worked on cooking the lasagna, which is the sum of the preparation time in minutes, and the time in minutes the lasagna has spent in the oven at the moment.

```c
elapsed_time_in_minutes(3, 20);
// => 26
```

## Source

### Created by

- @bergjohan
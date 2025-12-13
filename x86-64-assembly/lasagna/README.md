# Lasagna

Welcome to Lasagna on Exercism's x86-64 Assembly Track.
If you need help running the tests or submitting your code, check out `HELP.md`.
If you get stuck on the exercise, check out `HINTS.md`, but try and solve it without using those first :)

## Introduction

## Comments

The x86-64 track in Exercism uses **NASM** (The Netwide Assembler) as its assembler.
In NASM, comments are prefixed by a semicolon (`;`).

Comments may be placed anywhere in the program and everything that comes after a `;` is ignored by the assembler.

## Constants

An assembler-time constant can be defined in NASM using **equ**.
For instance, this defines a constant named `UNIVERSE` with the value `42`:

```x86asm
UNIVERSE equ 42
```

Constants are evaluated once, when defined, and can _not_ be redefined later.

## General Purpose Registers (GPRs)

In assembly, instead of variables, we typically use registers to store values.
A **CPU Register** is a piece of fast memory inside a computer's processor.
Most computations are carried out in the CPU's registers.

Some of the registers are used for a variety of different computations and are called **General Purpose Registers (GPRs)**.
Others have special or dedicated purposes.

In x86-64, there are 16 64-bit General Purpose Registers (GPRs), which can also be accessed as 32-bit, 16-bit, or 8-bit.
The GPRs are described below, where `n` in `rn` ranges from 8 to 15: `r8`, `r9`, `r10`, `r11`, `r12`, `r13`, `r14` and `r15`.

| 64-bit | 32-bit | 16-bit | 8-bit |
| :----: | :----: | :----: | :---: |
|  rax   |  eax   |   ax   | ah/al |
|  rbx   |  ebx   |   bx   | bh/bl |
|  rcx   |  ecx   |   cx   | ch/cl |
|  rdx   |  edx   |   dx   | dh/dl |
|  rsi   |  esi   |   si   |  sil  |
|  rdi   |  edi   |   di   |  dil  |
|  rbp   |  ebp   |   bp   |  bpl  |
|  rsp   |  esp   |   sp   |  spl  |
|   rn   |  rnd   |  rnw   |  rnb  |

When using less than 64-bits, the bits accessed are usually from the lower portion of the register.
The exception to this rule are `ah`, `bh`, `ch` and `dh`, which access the upper 8-bits from the 16-bits portion of the register.

Illustration of how the bits are accessed for the `rax` register:

```
+--------+---------------------------------------+
| 64-bit |                  rax                  |
+--------+-------------------+-------------------+
| 32-bit |                   |        eax        |
+--------+-------------------+---------+---------+
| 16-bit |                             |    ax   |
+--------+-----------------------------+----+----+
| 8-bit  |                             | ah | al |
+--------+-----------------------------+----+----+
```

Some of those registers must be preserved accross function calls: `rbp`, `rsp`, `rbx`, `r12`, `r13`, `r14` and `r15`.
Failing to preserve them may lead to an error or to undefined behaviour.

The others are not preserved and may be used freely: `rax`, `rcx`, `rdx`, `rdi`, `rsi`, `r8`, `r9`, `r10` and `r11`.

## Instructions

Instructions are pieces of computations a CPU can perform.
They usually have the following form:

```x86asm
name destination, source
```

So, the name of the instruction is placed first, then at least one whitespace, followed by the destination operand, a comma (`,`) and finally a source operand.
The source operand isn't typically modified by an instruction, just the destination operand.

Both operands must have the same size unless otherwise noted.
For example, the destination operand must also have 16 bits if the source operand has 16 bits.

For instance, to store a value in a register, we can use the `mov` instruction:

```x86asm
mov rax, rdx  ; rax = rdx
              ; mov is the name, rax is the destination operand and rdx is the source operand
```

The snippet above copies the contents of all 64 bits of `rdx`, the source operand, to all 64 bits of `rax`, which is the destination operand for the instruction.

It is possible to use constant integer numbers as source operands (but not as destination operands) in most instructions:

```x86asm
mov rcx, 42 ; rcx = 42
            ; rcx is the destination operand and 42 is the source operand
```

Note that writing to a 32-bit register also clears the upper bits, so `mov eax, 42` is the same as `mov rax, 42`.
This is not true for 16-bit and 8-bit registers.

For the arithmetic operations addition, subtraction, and multiplication, we can use the `add`, `sub`, and `imul` instructions:

```x86asm
add rax, rsi ; rax = rax + rsi
imul rax, rdi ; rax = rax * rdi
sub rax, r8 ; rax = rax - r8
```

## Functions

Instructions are organized in functions.
All functions are placed in the **section .text** of the source file.

A function declaration consists of:

1. A label with the name of the function, followed by a `:`.
2. The instructions that define the function.
3. The return instruction, `ret`.

This track uses the System V AMD64 ABI calling convention and the six first integers arguments are passed to a function in registers.
They are passed in the following order: `rdi`, `rsi`, `rdx`, `rcx`, `r8`, and `r9`.

An integer value is returned from the function in the `rax` register.

To call a function, we use the `call` instruction.
A function can be called anywhere in the same source file.
In order to make a function visible to other source files, the `global` directive must be used.

For instance, this declares a function `sum`:

```x86asm
section .text ; functions are placed here

global sum ; sum is visible to other source files

sum:
    ; first argument is passed in rdi
    ; second argument is passed in rsi
    ; return value is placed in rax

    mov rax, rdi ; rax is now equal to rdi
    add rax, rsi ; rax = rax + rsi

    ret ; function return
```

And this calls our `sum` function with the arguments 3 and 5:

```x86asm
mov rdi, 3  ; First argument in rdi
mov rsi, 5  ; Second argument in rsi
call sum

; The rax register now contains the value 8 (3 + 5), after sum returns
```

## Instructions

In this exercise you're going to write some code to help you cook a brilliant lasagna from your favorite cooking book.

You have four tasks, all related to the time spent cooking the lasagna.

~~~~exercism/note
These are the instructions mentioned in this concept:

| Instruction | Description                     |
|-------------|---------------------------------|
| mov a, b    | copies the contents from b to a |
| add a, b    | sets a to a + b                 |
| sub a, b    | sets a to a - b                 |
| imul a, b   | sets a to a * b                 |
| call a      | calls function a                |
| ret         | returns from a function         |
~~~~

## 1. Define the expected oven time in minutes

Define the `expected_minutes_in_oven` function that does not take any parameters and returns how many minutes the lasagna should be in the oven.
According to the cooking book, the expected oven time in minutes is 40:

```c
expected_minutes_in_oven();
// => 40
```

## 2. Calculate the remaining oven time in minutes

Define the `remaining_minutes_in_oven` function that takes the actual minutes the lasagna has been in the oven as a parameter and returns how many minutes the lasagna still has to remain in the oven, based on the expected oven time in minutes from the previous task.

```c
remaining_minutes_in_oven(30);
// => 10
```

## 3. Calculate the preparation time in minutes

Define the `preparation_time_in_minutes` function that takes the number of layers you added to the lasagna as a parameter and returns how many minutes you spent preparing the lasagna, assuming each layer takes you 2 minutes to prepare.

```c
preparation_time_in_minutes(2);
// => 4
```

## 4. Calculate the elapsed time in minutes

Define the `elapsed_time_in_minutes` function that takes two parameters, in this order:

1. The number of layers you added to the lasagna.
2. The number of minutes the lasagna has been in the oven.

The function should return how many minutes you've worked on cooking the lasagna.
This is the sum of the preparation time in minutes, and the time in minutes the lasagna has spent in the oven at the moment.

```c
elapsed_time_in_minutes(3, 20);
// => 26
```

## Source

### Created by

- @bergjohan

### Contributed to by

- @oxe-i
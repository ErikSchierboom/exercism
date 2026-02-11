# Hamming

Welcome to Hamming on Exercism's Odin Track.
If you need help running the tests or submitting your code, check out `HELP.md`.

## Introduction

Your body is made up of cells that contain DNA.
Those cells regularly wear out and need replacing, which they achieve by dividing into daughter cells.
In fact, the average human body experiences about 10 quadrillion cell divisions in a lifetime!

When cells divide, their DNA replicates too.
Sometimes during this process mistakes happen and single pieces of DNA get encoded with the incorrect information.
If we compare two strands of DNA and count the differences between them, we can see how many mistakes occurred.
This is known as the "Hamming distance".

The Hamming distance is useful in many areas of science, not just biology, so it's a nice phrase to be familiar with :)

## Instructions

Calculate the Hamming distance between two DNA strands.

We read DNA using the letters C, A, G and T.
Two strands might look like this:

    GAGCCTACTAACGGGAT
    CATCGTAATGACGGCCT
    ^ ^ ^  ^ ^    ^^

They have 7 differences, and therefore the Hamming distance is 7.

## Implementation notes

The Hamming distance is only defined for sequences of equal length, so an attempt to calculate it between sequences of different lengths should not work.

## Source

### Created by

- @gvrooyen

### Contributed to by

- @rmonnet

### Based on

The Calculating Point Mutations problem at Rosalind - https://rosalind.info/problems/hamm/
# OCR Numbers

Welcome to OCR Numbers on Exercism's Uiua Track.
If you need help running the tests or submitting your code, check out `HELP.md`.

## Introduction

Your best friend Marta recently landed their dream job working with a local history museum's collections.
Knowing of your interests in programming, they confide in you about an issue at work for an upcoming exhibit on computing history.
A local university's math department had donated several boxes of historical printouts, but given the poor condition of the documents, the decision has been made to digitize the text.
However, the university's old printer had some quirks in how text was represented, and your friend could use your help to extract the data successfully.

## Instructions

Optical Character Recognition or OCR is software that converts images of text into machine-readable text.
Given a grid of characters representing some digits, convert the grid to a string of digits.
If the grid has multiple rows of cells, the rows should be separated in the output with a `","`.

- The grid is made of one of more lines of cells.
- Each line of the grid is made of one or more cells.
- Each cell is three columns wide and four rows high (3x4) and represents one digit.
- Digits are drawn using pipes (`"|"`), underscores (`"_"`), and spaces (`" "`).

## Edge cases

- If the input is not a valid size, your program should indicate there is an error.
- If the input is the correct size, but a cell is not recognizable, your program should output a `"?"` for that character.

## Examples

The following input (without the comments) is converted to `"1234567890"`.

```text
      _  _     _  _  _  _  _  _  #
    | _| _||_||_ |_   ||_||_|| | # Decimal numbers.
    ||_  _|  | _||_|  ||_| _||_| #
                                 # The fourth line is always blank,
```

The following input is converted to `"123,456,789"`.

<!-- prettier-ignore-start -->

```text
    _  _ 
  | _| _|
  ||_  _|
         
    _  _ 
|_||_ |_ 
  | _||_|
         
 _  _  _ 
  ||_||_|
  ||_| _|
         
```

<!-- prettier-ignore-end -->

## Source

### Created by

- @erikschierboom

### Based on

Inspired by the Bank OCR kata - https://codingdojo.org/kata/BankOCR/
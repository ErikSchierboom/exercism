# Hints

## General

- Declaring a numeral with a specific type is done by appending the type to the numeral, e.g. `42_u8` for an unsigned 8-bit integer.
- Converting between different types is done by calling the `to_<type>` method on the numeral, e.g. `42u8.to_u16` for an unsigned 16-bit integer.

## 1. Navigation constants

- You need to define [constants][constants] that should contain a [integer][integers].
- The constant should be declared inside the `Navigation` class.
- The constant needs to be declared outside of any method.

## 2. Correct area analysis

- You need to convert the input to an unsigned integer.

## 3. Calculate the velocity

- To get the velocity you need to divide the distance by the time.
- The result of a numeric operation will be of the highest precision type, so you need to convert the result to the correct type.

[constants]: https://crystal-lang.org/reference/syntax_and_semantics/constants.html
[integers]: https://crystal-lang.org/reference/latest/syntax_and_semantics/literals/integers.html
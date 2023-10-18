# Wellington's Weather Station

Welcome to Wellington's Weather Station on Exercism's Crystal Track.
If you need help running the tests or submitting your code, check out `HELP.md`.
If you get stuck on the exercise, check out `HINTS.md`, but try and solve it without using those first :)

## Introduction

Crystal has a type, `Number` which is the base type for all numeric types.
Inside the Number type, there are two main sub-types: [`Int`][int] and [`Float`][float].

Int is short for integer and represents whole numbers.
Int can be both negative and positive, and doesn't have a decimal point.

```crystal
1.class
# => Int32

-1.class
# => Int32
```

Float represents numbers with a decimal point.
Floats can be both negative and positive.

```crystal
10.5.class
# => Float64
```

## Converting between Int and Float

You can convert between Int and Float using the `to_i` and `to_f` methods.
When converting from Float to Int the number is rounded down.

```crystal
1.to_f
# => 1.0

1.0.to_i
# => 1

1.9.to_i
# => 1
```

## Arithmetic operators

You can use the [basic arithmetic operators][math] on Int and Float.
The operators are `+`, `-`, `*`, `/`, and `%`.
You can mix and match Int and Float when using these operators.

### Addition & Subtraction & Multiplication

The `+` operator is used for addition, the `-` operator is used for subtraction, and the `*` operator is used for multiplication.

| Operator | Example        |
| -------- | -------------- |
| `+`      | `4 + 6 => 10`  |
| `-`      | `15 - 10 => 5` |
| `*`      | `2 * 3 => 6`   |

### Division

Division is used to divide numbers.
The `/` operator is used for division.
The result will always be a Float.

```crystal
4 / 2
# => 2.0

4.0 / 2
# => 2.0
```

~~~~exercism/caution
In some programming languages when dividing by zero the result will be an error.

In Crystal when dividing by zero the result will be `Infinity` or `-Infinity`.
The Only exception is when dividing zero by zero, which will result in `NaN` (Not a Number).
Infinity and NaN are special values in the Float type.

```crystal
1 / 0
# => Infinity

-1 / 0
# => -Infinity

0 / 0
# => NaN
```
~~~~

### Modulus

Modulus is used to get the remainder of a division.
The `%` operator is used for modulus.

```crystal
5 % 2
# => 1

5.0 % 2
# => 1.0

5 % 3
# => 2
```

~~~~exercism/caution
Dividing by zero when using modulo results in a DivisionByZeroError.
This is different from normal division.

```crystal
1 % 0
# Error: Unhandled exception: Division by 0 (DivisionByZeroError)
```
~~~~

## Rounding

The `round` method takes an optional argument which is the number of decimal places to round to.
The default number of decimal places is 0.

```crystal
1.0.round
# => 1

1.5.round
# => 2

1.234.round(2)
# => 1.23
```

## Priority and parentheses

Crystal allows parentheses(`()`) which can be used to group expressions.
This is useful when you want to change the order of operations.

When using multiple arithmetic operators the order of operations is the same as in mathematics, also known as [PEMDAS][pemdas].
It follows the order of parentheses(`()`), exponents(`**`), multiplication(`*`) and division(`/`), and addition(`+`) and subtraction(`-`).

```crystal
2 + 3 - 4 * 4
# => -11

(2 + 3 - 4) * 4
# => 4
```

[pemdas]: https://en.wikipedia.org/wiki/Order_of_operations
[math]: https://crystal-lang.org/reference/latest/tutorials/basics/30_math.html
[int]: https://crystal-lang.org/reference/latest/syntax_and_semantics/literals/integers.html
[float]: https://crystal-lang.org/reference/latest/syntax_and_semantics/literals/floats.html

## Instructions

The weather station of Wellington is going to replace its manual temperature recording system with a new digital one.
In the old system, the calculations were performed manually.
In the new system, they will be automated.
The calculations include converting the temperature from Celsius to Fahrenheit, and finding the average temperature.
The new system has sensors to record temperature data in Celsius.

The Wellington weather station wants you to help them with the new system.

## 1. Convert the temperature from Celsius to Kelvin

The weather station has a section on its website that is specified for researchers.
The researchers are interested in the temperature in Kelvin.

Kelvin is a unit of measurement for temperature.
It has the same scale as Celsius, but with a different starting point.
Its starting point is absolute zero, which is 0K (Kelvin) or -273.15°C (Celsius).

Here is a table showing the conversion between Celsius and Kelvin:

| Celsius(°C) | Kelvin(K) |
| ----------- | --------- |
| -273.15     | 0         |
| -100        | 173.15    |
| 0           | 273.15    |
| 100         | 373.15    |

The weather station wants you to implement a method that converts a temperature from Celsius to Kelvin.

Implement the `Temperature#to_kelvin` method that takes an argument `celsius` and returns the temperature in Kelvin by adding 273.15 to the given `celsius` value.

```crystal
Temperature.new.to_kelvin(0)
# => 273.15
```

## 2. Round the temperature

The weather station temperature sensor is very precise.
It can measure the temperature to the nearest 0.0001°C.
The weather station only wants to display the temperature rounded to 1 decimal place since most users are not interested in that level of precision.

The weather station would thereby like you to implement a method that rounds the temperature to 1 decimal place.

Implement the `Temperature#round` method that takes an argument `celsius` and returns the temperature rounded to 1 decimal place.

```crystal
Temperature.new.round(10.1234)
# => 10.1

Temperature.new.round(10.1567)
# => 10.2
```

## 3. Convert the temperature from Celsius to Fahrenheit

The weather station has a section on its website that is specified for tourists.
The tourists are interested in the temperature in Fahrenheit.

Fahrenheit is a unit of measurement for temperature.
It has a different scale than Celsius.
0°C is 32°F, and 1 degree Celsius is equal to 1.8 degrees Fahrenheit.

Here is a table showing the conversion between Celsius and Fahrenheit:

| Celsius(°C) | Fahrenheit(°F) |
| ----------- | -------------- |
| -273.15     | -459.8         |
| -100        | 148            |
| 0           | 32             |
| 100         | 212            |

The weather station wants you to implement a method that converts a temperature from Celsius to Fahrenheit.

Implement the `Temperature#to_fahrenheit` method that takes an argument `celsius` and returns the temperature in Fahrenheit as an integer.

```crystal
Temperature.new.to_fahrenheit(10)
# => 50
```

## 4. Get the number of missing sensors

During the installation of the temperature sensors, the maintenance workers realized some sensors were missing.
Each temperature measurement unit requires 4 temperature sensors.
The maintenance team counted how many sensors they had, but they do not know how many sensors are missing.
They would like to get some help counting how many sensors they need to buy to build another complete temperature measurement unit.

Implement the `Temperature#number_missing_sensors` method that takes an argument `number_of_sensors` and returns the number of missing sensors.

```crystal
Temperature.new.number_missing_sensors(10)
# => 2
```

## Source

### Created by

- @meatball133

### Contributed to by

- @ryanplusplus
- @glennj
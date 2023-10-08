# Navigation Computer

Welcome to Navigation Computer on Exercism's Crystal Track.
If you need help running the tests or submitting your code, check out `HELP.md`.
If you get stuck on the exercise, check out `HINTS.md`, but try and solve it without using those first :)

## Introduction

Crystal has a variety of different number types for different purposes.
For example, some types are faster but have a smaller range of possible values than other types.
Some that have a larger range of possible values but are slower.

In Crystal, there are both signed and unsigned integer types.
The signed integer types can be positive or negative.
The unsigned integer types can only be positive.

## Signed integers types

These are the [signed integer types][int] in Crystal:

| Type     | Size (bits) | Range                                                                                                       |
| -------- | ----------- | ----------------------------------------------------------------------------------------------------------- |
| `Int8`   | 8           | -128 to 127                                                                                                 |
| `Int16`  | 16          | -32_768 to 32_767                                                                                           |
| `Int32`  | 32          | -2_147_483_648 to 2_147_483_647                                                                             |
| `Int64`  | 64          | -9_223_372_036_854_775_808 to 9_223_372_036_854_775_807                                                     |
| `Int128` | 128         | -170_141_183_460_469_231_731_687_303_715_884_105_728 to 170_141_183_460_469_231_731_687_303_715_884_105_727 |

The smaller types use less memory and are faster than the larger types but have a smaller range of possible values.

Where you know that values will be within a certain range, it is best to use the smallest type possible to save memory and improve performance.

The default integer type is `Int32`.
To declare an integer with a specific type you can use the type name as a suffix, by adding `<number>_i<bit>`.

```crystal
1_i8.class
# => Int8
```

To convert between different integer types you can use the `to_i<bit>` method.
The `to_i` method converts to the default integer type, which is `Int32`.

```crystal
1_i8.to_i16.class
# => Int16

2_i16.to_i.class
# => Int32
```

## Unsigned integers types

These the [unsigned integer][uint] types in Crystal:

`UInt8`, `UInt16`, `UInt32`, `UInt64`, `UInt128`

The only difference to signed integers is that unsigned integers can only be positive.
To declare an unsigned integer with a specific type you can use the type name as a suffix, by adding `<number>_u<bit>`.
To convert between different unsigned integer types you can use the `to_u<bit>` method.
The `to_u` method converts to the default unsigned integer type, which is `UInt32`.

```crystal
1_u8.to_u16.class
# => UInt16
```

## Floating point types

These are the floating point types in Crystal:

| Type      | Size (bits) | Range                |
| --------- | ----------- | -------------------- |
| `Float32` | 32          | 1.2E-38 to 3.4E+38   |
| `Float64` | 64          | 2.3E-308 to 1.7E+308 |

There are two different [floating point types][float], one is more precise than the other.

The default floating point type is `Float64`.

To convert between different floating point types you can use the `to_f<bit>` method.
The `to_f` method converts to the default floating point type, which is `Float64`.

[float]: https://crystal-lang.org/api/latest/Float.html
[int]: https://crystal-lang.org/api/latest/Int.html
[uint]: https://crystal-lang.org/api/latest/UInt32.html

## Instructions

The ESA (Exercism Space Agency) is at full speed in planning a new mission to [Phobos][phobos], a moon of Mars.
The mission's goal is to land a probe on the surface of Phobos and to send back data about the surface.
ESA has requested your help to build the navigation computer for the probe.
The navigation computer has limited memory so we need to keep the memory usage as low as possible.
Thereby we need to use the right data types.

## 1. Navigation constants

The navigation computer needs to know the distance between some objects in space to do the right calculations, the distance is measured in km.

Define the following constants:

- `NEPTUNE_DISTANCE` with the value `4_400_000_000` which should be stored as a `Int64`
- `MARS_DISTANCE` with the value `227_940_000` which should be stored as a `Int32`
- `ATMOSPHERE_DISTANCE` with the value `10_000` which should be stored as a `Int16`

## 2. Correct area analysis

The navigation computer needs to know the area of some objects in space to do the right calculations.
An area can **NOT** be negative.
The engineers had the plan that the program would generate an overflow error when the area is negative.
But the engineers forgot to change the signed integer to an unsigned integer.

Thereby the engineers would like a program that converts the signed integer to an unsigned integer.

Implement the `Navigation#correct_area_analysis` method that takes a `measurement` as an argument and returns the area as an unsigned integer with 32 bits.

```crystal
measurement = 52554
measurement.class
# => Int32

Navigation.new.correct_area_analysis(measurement)
# => 52554

Navigation.new.correct_area_analysis(measurement).class
# => UInt32
```

## 3. Calculate the velocity

The navigation computer needs to know the velocity of the probe.
The velocity is measured in m/s.

To get the velocity we need to know the distance and the time it took to travel that distance.
Then take the distance and divide it by the time.

The velocity doesn't have to be super accurate and will never be a big number, therefore we can use a `Float32`.

Implement the `Navigation#calculate_velocity` method that takes `distance` and `time` as arguments and returns the velocity as a `Float` with 32 bits.

```crystal
distance = 52554
time = 2.5

Navigation.new.calculate_velocity(distance, time)
# => 21021.6

Navigation.new.calculate_velocity(distance, time).class
# => Float32
```

[phobos]: https://en.wikipedia.org/wiki/Phobos_(moon)

## Source

### Created by

- @meatball133

### Contributed to by

- @ihid
- @glennj
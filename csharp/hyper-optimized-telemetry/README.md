# Hyper-optimized Telemetry

Welcome to Hyper-optimized Telemetry on Exercism's C# Track.
If you need help running the tests or submitting your code, check out `HELP.md`.
If you get stuck on the exercise, check out `HINTS.md`, but try and solve it without using those first :)

## Introduction

C#, like many statically typed languages, provides a number of types that represent integers, each with its own range of values. At the low end, the `sbyte` type has a minimum value of -128 and a maximum value of 127. Like all the integer types these values are available as `<type>.MinValue` and `<type>.MaxValue`. At the high end, the `long` type has a minimum value of -9,223,372,036,854,775,808 and a maximum value of 9,223,372,036,854,775,807. In between lie the `short` and `int` types.

The ranges are determined by the storage width of the type as allocated by the system. For example, a `byte` uses 8 bits and a `long` uses 64 bits.

Each of the above types is paired with an unsigned equivalent: `sbyte`/`byte`, `short`/`ushort`, `int`/`uint` and `long`/`ulong`. In all cases the range of the values is from 0 to the positive signed maximum times 2 plus 1.

| Type   | Width  | Minimum                    | Maximum                     |
| ------ | ------ | -------------------------- | --------------------------- |
| sbyte  | 8 bit  | -128                       | +127                        |
| short  | 16 bit | -32_768                    | +32_767                     |
| int    | 32 bit | -2_147_483_648             | +2_147_483_647              |
| long   | 64 bit | -9_223_372_036_854_775_808 | +9_223_372_036_854_775_807  |
| byte   | 8 bit  | 0                          | +255                        |
| ushort | 16 bit | 0                          | +65_535                     |
| uint   | 32 bit | 0                          | +4_294_967_295              |
| ulong  | 64 bit | 0                          | +18_446_744_073_709_551_615 |

A variable (or expression) of one type can easily be converted to another. For instance, in an assignment operation, if the type of the value being assigned (lhs) ensures that the value will lie within the range of the type being assigned to (rhs) then there is a simple assignment:

```csharp
uint ui = uint.MaxValue;
ulong ul = ui;    // no problem
```

On the other hand if the range of type being assigned from is not a subset of the assignee's range of values then a cast, `()` operation is required even if the particular value is within the assignee's range:

```csharp
short s = 42;
uint ui = (uint)s;
```

## Bit conversion

The `BitConverter` class provides a convenient way of converting integer types to and from arrays of bytes.

## Instructions

Work continues on the remote control car project. Bandwidth in the telemetry system is at a premium and you have been asked to implement a message protocol for communicating telemetry data.

Data is transmitted in a buffer (byte array). When integers are sent, the size of the buffer is reduced by employing the protocol described below.

Each value should be represented in the smallest possible integral type (types of `byte` and `sbyte` are not included as the saving would be trivial):

| From                       | To                        | Type     |
| -------------------------- | ------------------------- | -------- |
| 4_294_967_296              | 9_223_372_036_854_775_807 | `long`   |
| 2_147_483_648              | 4_294_967_295             | `uint`   |
| 65_536                     | 2_147_483_647             | `int`    |
| 0                          | 65_535                    | `ushort` |
| -32_768                    | -1                        | `short`  |
| -2_147_483_648             | -32_769                   | `int`    |
| -9_223_372_036_854_775_808 | -2_147_483_649            | `long`   |

The value should be converted to the appropriate number of bytes for its assigned type. The complete buffer comprises a byte indicating the number of additional bytes in the buffer (_prefix byte_) followed by the bytes holding the integer (_payload bytes_).

Some of the types use an identical number of bytes (e.g. the `uint` and `int` types). Normally, they would have the same _prefix byte_, but that would make decoding problematic. To counter this, the protocol introduces a little trick: for signed types, their _prefix byte_ value is `256` minus the number of additional bytes in the buffer.

Only the prefix byte and the number of following bytes indicated by the prefix will be sent in the communication. Internally a 9 byte buffer is used (with trailing zeroes, as necessary) both by sending and receiving routines.

## 1. Encode an integral value ready to send

Please implement the static method `TelemetryBuffer.ToBuffer()` to encode a buffer taking the parameter passed to the method.

```csharp
// Type: ushort, bytes: 2, signed: no, prefix byte: 2
TelemetryBuffer.ToBuffer(5)
// => {0x2, 0x5, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0 };

// Type: int, bytes: 4, signed: yes, prefix byte: 256 - 4
TelemetryBuffer.ToBuffer(Int32.MaxValue)
// => {0xfc, 0xff, 0xff, 0xff, 0x7f, 0x0, 0x0, 0x0, 0x0 };
```

## 2. Decode a received buffer

Please implement the static method `TelemetryBuffer.FromBuffer()` to decode the buffer received and return the value in the form of a `long`.

```csharp
TelemetryBuffer.FromBuffer(new byte[] {0xfc, 0xff, 0xff, 0xff, 0x7f, 0x0, 0x0, 0x0, 0x0 })
// => 2147483647
```

If the prefix byte is not one of `-8`, `-4`, `-2`, `2` or `4` then `0` should be returned.

## Source

### Created by

- @mikedamay

### Contributed to by

- @ErikSchierboom
- @yzAlvin
# Hyperia Forex

Welcome to Hyperia Forex on Exercism's C# Track.
If you need help running the tests or submitting your code, check out `HELP.md`.
If you get stuck on the exercise, check out `HINTS.md`, but try and solve it without using those first :)

## Introduction

The principal arithmetic and comparison operators can be adapted for use by your own classes and structs. This is known as _operator overloading_.

Most operators have the form:

```csharp
static <return type> operator <operator symbols>(<parameters>);
```

Cast operators have the form:

```csharp
static (explicit|implicit) operator <cast-to-type>(<cast-from-type> <parameter name>);
```

Operators behave in the same way as static methods. An operator symbol takes the place of a method identifier, and they have parameters and a return type. The type rules for parameters and return type follow your intuition and you can rely on the compiler to provide detailed guidance.

## Instructions

You've been tempted back to Hyperia (with the high inflation) for an eye watering daily rate.

The Central Bank is contemplating introducing the US Dollar as a second currency so all the accounting systems have to be adapted to handle multiple currencies.

You have been asked to implement the currency amount object.

## 1. Enable the currency amount to be tested for equality

Please modify the `CurrencyAmount` struct to handle equality. If the two currency amount structs do not have the same currency ("USD" or "HD") then an instance of `ArgumentException` should be thrown.

```csharp
CurrencyAmount amountA = new CurrencyAmount(55, "HD");
CurrencyAmount amountB = new CurrencyAmount(55, "HD");
CurrencyAmount amountC = new CurrencyAmount(55, "USD");
amountA == amountB
// => true
amountA != amountB
// => false
amountA == amountC
// => ArgumentException
amountA != amountC
// => ArgumentException
```

## 2. Compare currency amounts

Please modify the `CurrencyAmount` struct to handle comparisons (`>` and `<`, only). If the two currency amount structs do not have the same currency ("USD" or "HD") then an instance of `ArgumentException` should be thrown.

```csharp
CurrencyAmount amountA = new CurrencyAmount(55, "HD");
amountA > new CurrencyAmount(50, "HD")
// => true
amountA < new CurrencyAmount(50, "HD")
// => false
amountA > new CurrencyAmount(50, "USD")
// => ArgumentException
```

## 3. Add and subtract currency amounts

Please modify the `CurrencyAmount` struct to handle arithmetic addition and subtraction (`+` and `-`, only). If the two currency amount structs do not have the same currency ("USD" or "HD") then an instance of `ArgumentException` should be thrown.

```csharp
CurrencyAmount amountA = new CurrencyAmount(55, "HD");
CurrencyAmount amountB = new CurrencyAmount(100, "HD");
CurrencyAmount amountC = new CurrencyAmount(55, "USD");
amountA + amountB
// => {155, HD}
amountB - amountA
// => {45, HD}
amountA + amountC
// => ArgumentException
```

## 4. Multiply and divide currency amounts

Please modify the `CurrencyAmount` struct to handle arithmetic multiplication and division (`*` and `/`, only).

```csharp
CurrencyAmount amountA = new CurrencyAmount(10, "HD");
amountA * 2m
// => {20, HD}
amountA / 2m
// => {5, HD}
```

## 5. Convert the currency amount to a double

Please modify the `CurrencyAmount` struct so that an instance can be explicitly cast to a `double`.

```csharp
CurrencyAmount amountA = new CurrencyAmount(55.5m, "HD");
(double)amountA
// => 55.5d
```

## 6. Convert the currency amount to a decimal

Please modify the `CurrencyAmount` struct so that an instance can be implicitly converted to a `decimal`.

```csharp
CurrencyAmount amountA = new CurrencyAmount(55.5m, "HD");
decimal d = amountA;
// => d == 55.5m
```

## Source

### Created by

- @mikedamay

### Contributed to by

- @ErikSchierboom
- @yzAlvin
- @sanderploegsma
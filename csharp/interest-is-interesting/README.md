# Interest is Interesting

Welcome to Interest is Interesting on Exercism's C# Track.
If you need help running the tests or submitting your code, check out `HELP.md`.
If you get stuck on the exercise, check out `HINTS.md`, but try and solve it without using those first :)

## Introduction

## Floating Point Numbers

A floating-point number is a number with zero or more digits behind the decimal separator. Examples are `-2.4`, `0.1`, `3.14`, `16.984025` and `1024.0`.

Different floating-point types can store different numbers of digits after the digit separator - this is referred to as its precision.

C# has three floating-point types:

- `float`: 4 bytes (~6-9 digits precision). Written as `2.45f`.
- `double`: 8 bytes (~15-17 digits precision). This is the most common type. Written as `2.45` or `2.45d`.
- `decimal`: 16 bytes (28-29 digits precision). Normally used when working with monetary data, as its precision leads to less rounding errors. Written as `2.45m`.

As can be seen, each type can store a different number of digits. This means that trying to store PI in a `float` will only store the first 6 to 9 digits (with the last digit being rounded).

## While Loops

In this exercise you may also want to use a loop. There are several ways to write loops in C#, but the `while` loop is most appropriate here:

```csharp
int x = 23;

while (x > 10)
{
    // Execute logic if x > 10
    x = x - 2;
}
```

## Do While Loops

A less commonly used alternative to the above syntax is a `do-while` loop:

```csharp
int x = 23;

do
{
    // Execute logic if x > 10
    x = x - 2;
} while (x > 10)
```

## Instructions

In this exercise you'll be working with savings accounts. Each year, the balance of your savings account is updated based on its interest rate. The interest rate your bank gives you depends on the amount of money in your account (its balance):

- 3.213% for a negative balance (balance gets more negative).
- 0.5% for a positive balance less than `1000` dollars.
- 1.621% for a positive balance greater than or equal to `1000` dollars and less than `5000` dollars.
- 2.475% for a positive balance greater than or equal to `5000` dollars.

You have four tasks, each of which will deal your balance and its interest rate.

## 1. Calculate the interest rate

Implement the (_static_) `SavingsAccount.InterestRate()` method to calculate the interest rate based on the specified balance:

```csharp
SavingsAccount.InterestRate(balance: 200.75m)
// 0.5f
```

Note that the value returned is a `float`.

## 2. Calculate the interest

Implement the (_static_) `SavingsAccount.Interest()` method to calculate the interest based on the specified balance:

```csharp
SavingsAccount.Interest(balance: 200.75m)
// 1.00375m
```

Note that the value returned is a `decimal`.

## 3. Calculate the annual balance update

Implement the (_static_) `SavingsAccount.AnnualBalanceUpdate()` method to calculate the annual balance update, taking into account the interest rate:

```csharp
SavingsAccount.AnnualBalanceUpdate(balance: 200.75m)
// 201.75375m
```

Note that the value returned is a `decimal`.

## 4. Calculate the years before reaching the desired balance

Implement the (_static_) `SavingsAccount.YearsBeforeDesiredBalance()` method to calculate the minimum number of years required to reach the desired balance given annually compounding interest:

```csharp
SavingsAccount.YearsBeforeDesiredBalance(balance: 200.75m, targetBalance: 214.88m)
// 14
```

Note that the value returned is an `int`.

~~~~exercism/note
When applying simple interest to a principal balance, the balance is multiplied by the interest rate and the product of the two is the interest amount.

Compound interest on the other hand is done by applying interest on a recurring basis.
On each application the interest amount is computed and added to the principal balance so that subsequent interest calculations are subject to a greater principal balance.
~~~~

## Source

### Created by

- @ErikSchierboom
- @yzAlvin
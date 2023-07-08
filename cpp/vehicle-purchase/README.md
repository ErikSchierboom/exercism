# Vehicle Purchase

Welcome to Vehicle Purchase on Exercism's C++ Track.
If you need help running the tests or submitting your code, check out `HELP.md`.
If you get stuck on the exercise, check out `HINTS.md`, but try and solve it without using those first :)

## Introduction

## Comparisons

In C++, you can compare values using the comparison operators.

| Comparison       | Operator |
| ---------------- | -------- |
| equal            | `==`     |
| not equal        | `!=`     |
| less             | `<`      |
| less or equal    | `<=`     |
| greater          | `>`      |
| greater or equal | `>=`     |

The result of these comparisons is always a boolean value:

```cpp
int a{3};

bool eq1 = a != 4; // true

bool eq2 = a > 5;  // false
```

The operators `==` and `!=` check whether a value is equal to another or not, respectively.
Here are some common examples:

```cpp
bool eq3 == 3; // false, integer comparison

bool eq4 = 2.1 != 2.2; // true, float comparison

bool eq5 = "hello" == "hello"; // true, string comparison
```

The other operators check if one value is greater than (`>`), greater or equal to (`>=`), less than (`<`), and less or equal to (`<=`) to another value.
This kind of comparison is available for numbers and strings.
When comparing strings, the dictionary order (also known as lexicographic order) is followed.

```cpp
bool eq6 = 2 > 3; // false, integer comparison

bool eq7 = 1.2 < 1.3; // true, float comparison

bool eq8 = "Hello" < "World"; // true, string comparison
```

## If Statements

Conditionals in C++ are similar to conditionals in other languages.
The underlying type of any conditional operation is the `bool` type, which can have the value of `true` or `false`.
Conditionals are often used as flow control mechanisms to check for various conditions.

An `if` statement can be used, which executes its code if the underlying condition is `true` like this:

```cpp
std::string value{"val"};

if (value == "val") {
    return "was val";
}
```

In scenarios involving more than one case many `if` statements can be chained together using the `else if` and `else` statements.

```cpp
int number{33};

if (number > 0) {
   return "positive";
} else if (number < 0) {
    return "negative";
} else {
   return "zero";
}
```

Since C++17 if-statements can also include a short initialization statement that can be used to initialize one or more variables for the if statement.
For example:

```cpp
int num{7};
if (int v{2 * num}; v > 10) {
    return v;
} else {
    return num;
}
// => 14
```

> Note: any variables created in the initialization cannot be accessed after the end of the if statement.

## Instructions

In this exercise, you are going to write some code to help you prepare to buy a vehicle.

You have three tasks, one to determine if you need a license, one to help you choose between two vehicles, and one to estimate the acceptable price for a used vehicle.

## 1. Determine if you will need a driver's license

Some vehicle kinds require a driver's license to operate them.
Assume only the kinds `"car"` and `"truck"` require a license, everything else can be operated without a license.

Implement the `needs_license(kind)` function that takes the kind of vehicle as a string and returns a boolean indicating whether you need a license for that kind of vehicle.

```cpp
needs_license("car")
// => true

needs_license("bike")
// => false

needs_license("truck")
// => true
```

## 2. Choose between two potential vehicles to buy

You evaluate your options of available vehicles.
You manage to narrow it down to two options but you need help making the final decision.
For that, implement the function `choose_vehicle(option1, option2)` that takes two vehicles as arguments and returns a decision that includes the option that comes first in lexicographical order.

```cpp
choose_vehicle("Wuling Hongguang", "Toyota Corolla")
// => "Toyota Corolla is clearly the better choice."

choose_vehicle("Volkswagen Beetle", "Volkswagen Golf")
// => "Volkswagen Beetle is clearly the better choice."
```

## 3. Calculate an estimation for the price of a used vehicle

Now that you made a decision, you want to make sure you get a fair price at the dealership.
Since you are interested in buying a used vehicle, the price depends on how old the vehicle is.
For a rough estimate, assume if the vehicle is less than 3 years old, it costs 80% of the original price it had when it was brand new.
If it is at least 10 years old, it costs 50%.
If the vehicle is at least 3 years old but less than 10 years, it costs 70% of the original price.

Implement the `calculate_resell_price(original_price, age)` function that applies this logic using `if`, `else if` and `else` (there are other ways if you want to practice).
It takes the original price and the age of the vehicle as arguments and returns the estimated price in the dealership.

```cpp
calculate_resell_price(1000, 1)
// => 800

calculate_resell_price(1000, 5)
// => 700

calculate_resell_price(1000.0, 15)
// => 500
```

> Note: the return value is of type `double`.

## Source

### Created by

- @vaeng
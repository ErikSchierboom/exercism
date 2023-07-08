# Interest is interesting

Welcome to Interest is interesting on Exercism's C++ Track.
If you need help running the tests or submitting your code, check out `HELP.md`.
If you get stuck on the exercise, check out `HINTS.md`, but try and solve it without using those first :)

## Introduction

## Loops

Loops are used to repeatedly execute some logic.
The two most common types are the `while loop` (indefinite looping) and the `for loop` (definite, or counted looping).
There is also the `for each` loop, that will come up in a later concept.

### General Syntax

The `for loop` consists of a header and a code block that contains the body of the loop wrapped in curly brackets.
The header consists of 3 components separated by semicolons `;`: init-statement, condition, and another expression.
Each of these may be empty.

```cpp
for (init_statement; condition; expression) {
  some_statement;
}
```

- The **init_statement** component is code that runs only once before the loop starts.
- The **condition** component must be some expression that evaluates to a `boolean` and controls when the loop should stop.
  The code inside the loop will run as long as this condition evaluates to `true`.
  As soon as this expression evaluates to `false`, no more iterations of the loop will run.
- The **expression** component is some code that will run at the end of each iteration.

The `while loop` executes its body as long as its **condition** check is `true`.
The code snippet below shows how to transform a `for` into a `while loop`.

```cpp
init_statement;
while(condition) {
    some_statement;
    expression;
}
```

### Interlude: Increments and Decrements

When working with loops it is often required to add 1 or subtract 1 from a counter variable which keeps track of the iterations.
This is so common, that the incrementing/decrementing actions have special operators: `++` and `--`.

They come in a **prefix** and a **postfix** form.
The prefix changes the variable before use in the statement and the postfix version afterward.
You probably want the prefix version most of the time.

```cpp
int a{3};
int b{--a};
// b is 2, a is now 2
int c{a++};
// c is 2, a is now 3
```

### For Loops - An example

The _init component_ usually sets up a counter variable, the _condition_ checks whether the loop should be continued or stopped and the _post component_ usually increments the counter at the end of each repetition.

```cpp
int sum{0}
for (int i{1}; i < 10; ++i) {
  sum += i;
}
```

This loop will sum the numbers from `1` to `9` (including `9`).

### Break and Continue

Inside a loop body, you can use the `break` keyword to stop the execution of the loop entirely:

```cpp
int sum{2};
while(true) {
    sum *= 2;
    if (sum > 1000)
        break;
}
// sum is now 1024
```

In contrast, the keyword `continue` only stops the execution of the current iteration and continues with the next one:

```cpp
int equal_sum{0};
for (int i{1}; i < 7; ++i) {
  if  (n%2 == 1) {
    continue;
  }
  equal_sum += i;
}
// equal_sum is now 12
```

~~~~exercism/note
It is usually easier to understand the logic of the loop, when the use of `break` and `continue` is minimized or entirely avoided.
Both keywords skip certain sections of the code and make it often more difficult to follow along.
~~~~

## Instructions

In this exercise, you'll be working with savings accounts.
Each year, the balance of your savings account is updated based on its interest rate.
The interest rate your bank gives you depends on the amount of money in your account (its balance):

- 3.213% for a balance less than `0` dollars (balance gets more negative).
- 0.5% for a balance greater than or equal to `0` dollars, and less than `1000` dollars.
- 1.621% for a balance greater than or equal to `1000` dollars, and less than `5000` dollars.
- 2.475% for a balance greater than or equal to `5000` dollars.

You have four tasks, each of which will deal with the balance and its interest rate.

## 1. Calculate the interest rate

Implement the `interest_rate` function to calculate the interest rate based on the specified balance:

```cpp
interest_rate(200.75);
// => 0.5
```

## 2. Calculate the interest

Implement the `yearly_interest` function to calculate the interest based on the specified balance:

```cpp
yearly_interest(200.75):
// => 1.003750
```

## 3. Calculate the annual balance update

Implement the `annual_balance_update` function to calculate the annual balance update, taking into account the interest rate:

```cpp
annual_balance_update(200.75);
// => 201.75375
```

## 4. Calculate the years before reaching the desired balance

Implement the `years_until_desired_balance` function to calculate the minimum number of years required to reach the desired balance, taking into account that each year, interest is added to the balance.
This means that the balance after one year is: start balance + interest for start balance.
The balance after the second year is the balance after one year + interest for the balance after one year.
And so on, until the current year's balance is greater than or equal to the target balance.

```cpp
double balance {200.75};
double targetBalance {214.88};
years_until_desired_balance(balance, targetBalance)
// => 14
```

Note that the value returned is an `int`.

## Source

### Created by

- @vaeng
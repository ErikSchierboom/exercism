# Vexing Vehicle Purchase

Welcome to Vexing Vehicle Purchase on Exercism's Julia Track.
If you need help running the tests or submitting your code, check out `HELP.md`.

## Introduction

There are three primary conditional statements that are used in Julia:

- `if`-expressions
- The ternary operator
- Short-circuit evaluation

## `if`-expressions

`if`-expressions in Julia are similar to those seen in other languages:

```julia
julia> function say_if_positive(n)
           if n > 0
               println("n is positive!")
           else
               println("n is not positive!")
           end
       end
say_if_positive (generic function with 1 method)

julia> say_if_positive(10)
n is positive!

julia> say_if_positive(-10)
n is not positive!
```

<!-- TODO: Add that fancy concept highlight embed thing to boolean expression -->

If the boolean expression following the `if` evaluates to `true`, the first block of code is run and the second block is skipped.
If the boolean expression following the `if` evaluates to `false`, the first block of code is skipped and the second block is run.
The program continues running at the first line of code after the `end` keyword.

~~~~exercism/note
In Julia, the `end` keyword signifies the end of all block expressions.
This syntax is not specific to `if`-expressions or function definitions.
~~~~

In cases where the second block of code would be just another `if`-expression, `elseif` allows us to avoid nesting `if`-expressions within the block:

```julia
julia> function dessert(fruit)
           if fruit == "apple"
               return "Apple Crumble"
           elseif fruit == "lemon"
               return "Lemon Meringue Pie"
           else
               return "Fruit Salad"
           end
       end
dessert (generic function with 1 method)

julia> dessert("apple")
"Apple Crumble"

julia> dessert("lemon")
"Lemon Meringue Pie"

julia> dessert("peach")
"Fruit Salad"
```

If an `if`-expression only needs to perform code for one of the cases, there's no need to write out the `else` branch.

## Ternary operator

Simple `if-else` statements can also be written using the ternary operator `a ? b : c`.
If `a` is true, then `b` will be evaluated.
Otherwise evaluate `c`.

For example the following function

```julia
julia> function diagnose(heartrate)
           if heartrate > 100
               println("Elevated heart rate.")
           else
               println("Nominal heart rate or dead.")
           end
       end
diagnose (generic function with 1 method)
```

can also be written as

```julia
julia> diagnose(heartrate) = heartrate > 100 ? println("Elevated heart rate.") : println("Nominal heart rate or dead.")
diagnose (generic function with 1 method)
```

This is especially useful if you want to assign a different value to a variable depending on a condition.
`x = a ? b : c` will assign `b` to `x` if `a` is `true` and otherwise assign `c` to `x`.
For example:

```julia
julia> function patient_status(heartrate)
           status = heartrate > 0 ? "alive" : "dead"

           println("The patient is ", status)
       end

julia> patient_status(100)
The patient is alive

julia> patient_status(0)
The patient is dead
```

## Short-Circuit Evaluation

If several boolean expressions are chained together using the `&&` and `||` operators, Julia will only evaluate the least amount of expressions that are necessary to determine the value of the entire chain.

For an example, consider the expression chain `n > 0 && k > 10`.
If `n` equals `5`, the first part of the chain, `n > 0`, is `true` and it's necessary to evaluate the second expression `k > 10` to determine if the entire expression is `true`.
However, if `n` equals `-5`, we know that the chain as a whole **cannot** be `true` because its first expression is `false`.

If we consider `n > 0 || k > 10` instead, the opposite happens.
If `n` equals `5`, the first part of the chain, `n > 0`, is `true` and we know that the whole chain will be `true` regardless of the second expression.
However, if `n` equals `-5`, it's necessary to evaluate the second expression.

This behaviour can be used to write very short `if` statements:

```julia
if a
    b
end
```

is equivalent to

```julia
a && b
```

The last expression in a chain of `&&` and `||` does not need to be a boolean expression.
You will often find this feature being used for early errors or returns.
For example, using the `dessert(fruit)` function from above:

```julia
julia> function whats_for_dessert(fruit, allergic_to)
           fruit == allergic_to && return "I can't eat that, guess I'll not have dessert tonight!"

           return dessert(fruit)
       end
whats_for_dinner (generic function with 1 method)

julia> whats_for_dinner("apple", "peach")
"Apple Crumble"

julia> whats_for_dinner("apple", "apple")
"I can't eat that, guess I'll not have dessert tonight!"
```

<!-- TODO: Mention ifelse(cond, x, y) somewhere as an infobox -->

## Instructions

In this exercise you're going to write some code to help you prepare to buy a new vehicle.

You have three tasks, one to help you determine the price of the vehicle you can afford, one to determine if you will need to get a licence, and one to help you compute your registration fee.

## 1. Compute whether or not you can afford the monthly payments on a given vehicle

The transport vehicle dealers in your town are all running a five year, 0% interest promotion that you would like to take advantage of.
Implement the `canibuy(vehicle, price, monthly_budget)` function that takes the name of the vehicle you are looking at, its price, and your monthly budget and returns a string letting you know whether you can afford the vehicle or not, if the monthly payment is within 10 of your monthly budget you will want to return a special reminder to be frugal:

```julia
julia> canibuy("1974 Ford Pinto", 516, 100)
"Yes! I'm getting a 1974 Ford Pinto."

julia> canibuy("2014 Bugatti Veyron", 562_500, 5000)
"Damn! No 2014 Bugatti Veryon for me."

julia> canibuy("2020 Gazelle Medeo", 3000, 50)
"I'll have to be frugal if I want a 2020 Gazelle Medeo."
```

~~~~exercism/note
Numbers in Julia can contain `_` to group digits together.
E.g. `562_500` equals `562500`.
~~~~

## 2. Determine if you will need a drivers licence

If you decide to buy a car, you will require a drivers licence.
Bicycles do not require licences.
Implement the `licence(vehicle, kind)` function that takes the name of the vehicle and what kind of vehicle it is (either `"car"` or `"bike"`) and returns if you need a licence:

```julia
julia> licence("2014 Bugatti Veyron", "car")
"The 2014 Bugatti Veyron requires a licence to operate."

julia> licence("2020 Gazelle Medeo", "bike")
"The 2020 Gazelle Medeo requires no licence to operate."
```

## 3. Calculate the registration fee for your new vehicle

The registration fee for your new vehicle is based on the following formula:

- Bicycles do not need to be registered. Therefore the fee is 0€.
- For any car 10 years or older, the fee is a flat 25€.
- For any newer car:
  1. Start with a base cost that is either Manufacturer's Standard Retail Price (MSRP) for the car, or 25&nbsp;000€ whichever is greater.
  2. For each year of age, subtract 10% of the base price.
  3. Divide that value by 100. This is the registration fee you will have to pay.

Implement the `fee(msrp, age, kind)` function that takes the MSRP of the vehicle, its age in years and the kind of the vehicle (either `"car"` or `"bike"`), and returns the registration fee for that vehicle, according to the formula above.

```julia
julia> fee(562_500, 6, "car")
2250

julia> fee(25_000, 3, "car")
175

julia> fee(34_000, 30, "car")
25

julia> fee(3000, 0, "bike")
0
```

## Source

### Created by

- @SaschaMann

### Contributed to by

- @cmcaine
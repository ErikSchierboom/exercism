# Mixed Juices

Welcome to Mixed Juices on Exercism's Julia Track.
If you need help running the tests or submitting your code, check out `HELP.md`.
If you get stuck on the exercise, check out `HINTS.md`, but try and solve it without using those first :)

## Introduction

There are basically two types of loops:

1. Loop until a condition is satisfied.
2. Loop over the elements in a collection.

Both are possible in Julia, though the second may be more common.

## The `while` loop

For open-ended problems where the number of times round the loop is unknown in advance, Julia has the `while` loop.

The basic form is fairly simple:

```julia
while condition
    do_something()
end
```

In this case, the program will keep going round the loop until `condition` is no longer `true`.

Two ways to exit the loop early are available:

- A `break` causes the loop to exit, with execution continuing at the next line after the loop `end`.
- A `return x` stops execution of the current function, passing the return value `x` back to the caller.

With these options available, it can sometimes be convenient to create an "infinite" loop with `while true ... end`, then rely on finding a stopping condition within the loop body to trigger a `break` or `return`.

## Loop over a collection

The simplest illustration is to loop over a range.

If we want to do something 10 times:

```julia
for n in 1:10
    do_something(n)
end
```

If the current iteration fails to satisfy some condition, it is possible to skip immediately to the next iteration with a `continue`:

```julia
for n in 1:10
    if is_useless(n)
        continue
    end

    # we decided this iteration could be useful
    do_something_slow(n)
end
```

In a shorter form, the `if` block could be replaced by `is_useless(n) && continue`.

Many other collection types can be looped over: elements in an array, characters in a string, keys in a dictionary...

The examples so far loop over the range `1:10`, where the value is also the loop index.

More generally, the index may be needed and not just the value.
For this, the `eachindex()` function is used, for example `for i in eachindex(my_array) ... end`.

## Instructions

Your friend Li Mei runs a juice bar where she sells delicious mixed fruit juices.
You are a frequent customer in her shop and realized you could make your friend's life easier.
You decide to use your coding skills to help Li Mei with her job.

## 1. Determine how long it takes to mix a juice

Li Mei likes to tell her customers in advance how long they have to wait for a juice from the menu that they ordered.
She has a hard time remembering the exact numbers because the time it takes to mix the juices varies.
`"Pure Strawberry Joy"` takes 0.5 minutes, `"Energizer"` and `"Green Garden"` take 1.5 minutes each, `"Tropical Island"` takes 3 minutes and `"All or Nothing"` takes 5 minutes.
For all other drinks (e.g., special offers) you can assume a preparation time of 2.5 minutes.

To help your friend, write a function `time_to_mix_juice` that takes a juice from the menu as an argument and returns the number of minutes it takes to mix that drink.

```julia-repl
julia> time_to_mix_juice("Tropical Island")
3

julia> time_to_mix_juice("Berries & Lime")
2.5
```

## 2. Replenish the lime wedge supply

A lot of Li Mei's creations include lime wedges, either as an ingredient or as part of the decoration.
So when she starts her shift in the morning she needs to make sure the bin of lime wedges is full for the day ahead.

Implement the function `limes_to_cut` which takes the number of lime wedges Li Mei needs to cut and an array representing the supply of whole limes she has at hand.
She can get 6 wedges from a `"small"` lime, 8 wedges from a `"medium"` lime and 10 from a `"large"` lime.
She always cuts the limes in the order in which they appear in the list, starting with the first item.
She keeps going until she reaches the number of wedges that she needs or until she runs out of limes.

Li Mei would like to know in advance how many limes she needs to cut.
The `limes_to_cut` function should return the number of limes to cut.

```julia-repl
julia> limes_to_cut(25, ["small", "small", "large", "medium", "small"])
4
```

## 3. List the times to mix each order in the queue

Li Mei likes to keep track of how long it will take to mix the orders customers are waiting for.

Implement the `order_times` function, which takes a queue of orders and returns a vector of times to mix.

```julia-repl
julia> order_times(["Energizer", "Tropical Island"])
[1.5, 3.0]
```

## 4. Finish up the shift

Li Mei always works until 3pm.
Then her employee Dmitry takes over.
There are often drinks that have been ordered but are not prepared yet when Li Mei's shift ends.
Dmitry will then prepare the remaining juices.

To make the hand-over easier, implement a function `remaining_orders` which takes the number of minutes left in Li Mei's shift and an array of juices that have been ordered but not prepared yet.
The function should return the orders that Li Mei cannot start preparing before the end of her workday.

The time left in the shift will always be greater than 0.
The array of juices to prepare will never be empty.
Furthermore, the orders are prepared in the order in which they appear in the array.
If Li Mei starts to mix a certain juice, she will always finish it even if she has to work a bit longer.
If there are no remaining orders left that Dmitry needs to take care of, an empty vector should be returned.

```julia-repl
julia> remaining_orders(5, ["Energizer", "All or Nothing", "Green Garden"])
["Green Garden"]
```

## Source

### Created by

- @colinleach
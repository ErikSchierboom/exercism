# Election Day

Welcome to Election Day on Exercism's C++ Track.
If you need help running the tests or submitting your code, check out `HELP.md`.
If you get stuck on the exercise, check out `HINTS.md`, but try and solve it without using those first :)

## Introduction

## References

### Copies and References

With our current knowledge, it is a bit cumbersome to update a variable with the help of a function.
Every function argument is handled like a copy and does not change the original value.
Depending on the size of your type, this can have serious consequences for the performance of your code.

```cpp
int adjust_salary(int base, int kids) {
    return base + kids * 500;
}
int now_a_mother_of_twins{2500};
adjust_salary(now_a_mother_of_twins, 2);

// now_a_mother_of_twins is still 2500
now_a_mother_of_twins = adjust_salary(now_a_mother_of_twins, 2);
// now_a_mother_of_twins is now 3500
```

`References` can be seen as aliases - changes to them have an effect on the original variable.
`References` use an **ampersand** (`&`) in the type declaration.

```cpp
int balance{1000};
int& budget{balance};
int pro_computer_wheels{699};
budget -= pro_computer_wheels;
// budget is now 301;
// balance is also 301;
```
Reseating (changing the binding of a `reference`) is not possible.
You cannot have an unitialized `reference`.
`References` need to be initialized with an existing variable.

```cpp
int main_acc{1'000'000};
int side_acc{-20};
int& savings{main_acc};
// => main_acc and savings are 1'000'000

// try to reseat savings to use main account
savings = side_acc;
// savings and main_acc are now -20
// as this uses the **value** of side_acc
savings += 20;
// savings and main_acc are now 0, side_acc is stil -20

int& future_budget;
// => compiler error, reference must be bound!
```

### `void`

With the power of `references` you might not need to return a value from a function at all. 
`void` is used as a return type in this scenario. 

```cpp
void increase_power(int& level) {
    level += 500;
}
int goku{8700};
increase_power(goku);
// goku's power level?
// It's over 9000!
```

## Instructions

A local school near you has a very active students' association.
The students' association is managed by a president and once every 2 years,
elections are run to elect a new president.

In this year's election, it was decided that a new digital system to
count the votes was needed. The school needs your help building this new system.

## 1. Get the number of votes from an `ElectionResult`

The new system will need a way to get the number of votes from a counter.

The election result struct is already created for you and it's defined as:

```cpp
struct ElectionResult {
    // Name of the candidate
    std::string name{};
    // Number of votes the candidate has
    int votes{};
};
```

As all members in the `struct` are public, you don't need to write a `constructor` to initialize an `ElectionResult` object. 
You can use an `initializer list` instead:

```cpp
ElectionResult hamilton{"Alex", 1804};
// => the hamilton object was intialized with the name "Alex" and 1804 votes.
```

Create a function `vote_count` that will take a reference to an `ElectionResult` as an argument and will return the number of votes in the `ElectionResult`.

```cpp
vote_count(hamilton);
// => 1804
```

## 2. Increment the votes of an `ElectionResult`

It's finally time to process the votes!
Now you need a way to increment the votes in an `ElectionResult`.

Create a `void` function `increment_vote_count` that will take a reference to an `ElectionResult` as an argument and a number of votes, and will increment the `ElectionResult` by that number of votes.

```cpp
ElectionResult burr{"Aaron " 1801};

increment_vote_count(burr, 3);

vote_count(burr);
// => 1804
```

## 3. Vote counting and Presidency 

The school handed in their votes and it is now time to check the results for the winner.

Create a function `determine_result` that receives a reference to a final count and returns a reference to the `ElectionResult` of the new president.
It should also change the name of the winner by prefixing it with "President". 
The final count is given in the form of a `reference` to `std::vector<ElectionResult>`, a vector with `ElectionResults` of all the participating candidates.

```cpp
ElectionResult sanchez{"Pedro", 471};
ElectionResult wheatley{"Summer", 340};
std::vector<ElectionResult> final_count{sanchez, wheatley};

ElectionResult& winner = determine_result(final_count);

winner.name;
// => "President Pedro"
```

To keep things simple, you can assume the following:
- The `vector` has at least one element.
- There will be no ties for first place.

## Source

### Created by

- @vaeng
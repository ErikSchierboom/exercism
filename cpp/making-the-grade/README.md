# Making the Grade

Welcome to Making the Grade on Exercism's C++ Track.
If you need help running the tests or submitting your code, check out `HELP.md`.
If you get stuck on the exercise, check out `HINTS.md`, but try and solve it without using those first :)

## Introduction

## Arrays and Vectors

C++ offers different containers to store elements of the same type in an ordered way.
There is `std::array` for containers of a fixed size and `std::vector`, which comes with dynamic resizing capabilities.

### Construction

When you declare an array or a vector you need to specify the type of elements, that container will hold.
Arrays also need a size.
Look at these examples to see the two container types' initializations:

```cpp
#include<array>
#include <string>

// std::array variable_name<element_type, size> {list of elements}
std::array<std::string, 3> indie_rock {"yeah", "yeah", "yeah"};
// indie_rock contains the elements "yeah" three times
```

Vectors usually need more space, as they allocate memory for further growth.
You do not need to specify a size:

```cpp
#include<vector>

// std::vector variable_name<element_type> {list of elements}
std::vector countdown<int> {3, 2, 1};
// my_vector contains the elements 3, 2 and 1
```

> Note: You do not need to know the exact mechanics behind the template concept yet, it will have its own concept further down the syllabus tree.

### Element access

Vectors and arrays share the same functions to access their elements.
You can use the member functions `front` and `back` to get the first and last elements of the container.
There is also `at` and the `[]` operator to access specific elements.

```cpp
countdown[0];
// => 3
countdown.at(2);
// => 1
countdown[1] = 4;
// countdown now contains 3, 4 and 1
indie_rock.back() = "yeahs";
// indie_rock is now "yeah", "yeah", "yeahs"
```

> Note: If you pick a position that is not in the range of your container, `[]` might lead to undefined behavior.
> The `at` function would raise an exception, which might make your life easier in the long term.

### Vector modifiers

As a `vector` is not fixed in size, it is possible to add or remove elements.
Two common functions for that purpose are `emplace_back` and `pop_back`.

```cpp
std::array<std::string, 3> witches {"Holly", "Alyssa", "Shannen"};
witches.pop_back();
// Shannen is no longer with the witches
witches.emplace_back("Rose");
// Rose has joined the team
```

### Capacity

You can check the containers for emptiness with the member function `empty`.
If you want to know the number of elements, you can use `size`.

## Instructions

You're a teaching assistant correcting student exams.
Keeping track of results manually is getting both tedious and mistake-prone.
You decide to make things a little more interesting by putting together some functions to count and calculate results for the class.

## 1. Rounding Scores

While you can give "partial credit" on exam questions, overall exam scores have to be `int`s.
So before you can do anything else with the class scores, you need to go through the grades and turn any `double` scores into `int`s.

Create the function `round_down_scores()` that takes a `vector` of `student_scores`.
The schools' requested rounding is a truncation.
Lucky for you, C++ can cast one type into another with `static_cast`.
The `static_cast` conversion from `double` to `int` cuts off any digit after the decimal.
This function should take the input `vector` and `return` a new vector with all the scores converted to `int`s.

```cpp
std::vector<double> student_scores {90.33, 40.5, 55.44, 70.05, 30.55, 25.45, 80.45, 95.3, 38.7, 40.3};
round_down_scores(student_scores)
// => {90, 40, 55, 70, 30, 25, 80, 95, 38, 40}
```

## 2. Non-Passing Students

As you were grading the exam, you noticed some students weren't performing as well as you'd hoped.
But you were distracted, and forgot to note exactly _how many_ students.

Create the function `count_failed_students()` that takes a `vector` of `student_scores`.
This function should count up the number of students who don't have passing scores and return that count as an integer.
A student needs a score greater than **40** to achieve a passing grade on the exam.

```cpp
count_failed_students({90,40,55,70,30,25,80,95,38,40});
// => 5
```

## 3. The "Best"

The teacher you're assisting wants to find the group of students who've performed "the best" on this exam.
What qualifies as "the best" fluctuates, so you need to find the student scores that are **greater than or equal to** the current threshold.

Create the function `above_threshold()` taking `student_scores` (a `vector` of grades), and `threshold` (an `int`, the "top score" threshold) as parameters.
This function should return a `vector` of all scores that are `>=` to `threshold`.

```cpp
above_threshold({90,40,55,70,30,68,70,75,83,96}, 75);
// => {90,75,83,96}
```

## 4. Calculating Letter Grades

The teacher you're assisting likes to assign letter grades as well as numeric scores.
Since students rarely score 100 on an exam, the "letter grade" lower thresholds are calculated based on the highest score achieved, and increment evenly between the high score and the failing threshold of **<= 40**.

Create the function `letter_grades()` that takes the "highest" score on the exam as a parameter, and returns an `array` (not a vector) of lower score thresholds for each "American style" grade interval: `["D", "C", "B", "A"]`.

```cpp
/*Where the highest score is 100, and failing is <= 40.
       "F" <= 40
 41 <= "D" <= 55
 56 <= "C" <= 70
 71 <= "B" <= 85
 86 <= "A" <= 100
*/

letter_grades(100);
// => {41, 56, 71, 86}


/*Where the highest score is 88, and failing is <= 40.
       "F" <= 40
 41 <= "D" <= 52
 53 <= "C" <= 64
 65 <= "B" <= 76
 77 <= "A" <= 88
*/

letter_grades(88);
// => {41, 53, 65, 77}
```

## 5. Matching Names to Scores

You have exam scores in descending order, and the respective student names (sorted in the order of their exam scores).
You would like to match each student's name with their exam score and print out an overall class ranking.

Create the function `student_ranking()` with parameters `student_scores` and `student_names`.
Match each student name on the student_names `vector` with their score from the student_scores `vector`.
You can assume each argument `vector` is sorted from highest score(er) to lowest score(er).
The function should return a `vector` of strings with the format `<rank>. <student name>: <student score>`.

```cpp
std::vector<int> student_scores {100, 99, 90, 84, 66, 53, 47};
std::vector<std::string> student_names {"Joci", "Sara","Kora","Jan","Indra","Bern", "Fred"};
student_ranking(student_scores, student_names)
// =>
//  {"1. Joci: 100", "2. Sara: 99", "3. Kora: 90", "4. Jan: 84", "5. Indra: 66", "6. Bern: 53", "7. Fred: 47"}
```

## 6. A "Perfect" Score

Although a "perfect" score of 100 is rare on an exam, it is interesting to know if at least one student has achieved it.

Create the function `perfect_score()` with parameters `student_scores` and `student_names`.
The lists are the same as in task 5.
The function should `return` _the first_ `<name>` (as a string) of the student who scored 100 on the exam.

If no 100 scores are found, an empty string `""` should be returned.

```cpp
perfect_score({"Nur", "Tony", "Fatima"}, {90, 80, 100});
// => "Fatima"

perfect_score({"Nur", "Tony"}, {90, 80});
// => ""
```

## Source

### Created by

- @vaeng
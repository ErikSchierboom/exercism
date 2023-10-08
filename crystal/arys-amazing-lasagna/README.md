# Ary's Amazing Lasagna

Welcome to Ary's Amazing Lasagna on Exercism's Crystal Track.
If you need help running the tests or submitting your code, check out `HELP.md`.
If you get stuck on the exercise, check out `HINTS.md`, but try and solve it without using those first :)

## Introduction

## Getting Started

### Variables

To declare a [variable][variables], you must use the `=` assignment operator.
In Crystal variables should be written in [snake_case][snake-case].

```crystal
number = 1
puts number # => 1

number = 2
puts number # => 2
```

### Constants

[Constants][constants] are declared using the same `=` assignment operator, but use all uppercase letters, also known as SCREAMING_SNAKE_CASE.

```crystal
NUMBER = 1
puts NUMBER # => 1
```

Assigning a value to a constant that is already defined will result in a compile-time error.

```crystal
NUMBER = 1

NUMBER = 2
# Error: already initialized constant NUMBER
```

### Types

Crystal is a compiled language, which means that every variable or method argument is assigned a type at compile time.
The compiler is capable of inferring the type of a variable or method argument.
Although in some cases it is necessary to specify the type.
The cases that requires a type to be set will be explained in later concepts.

### Methods

[Methods][methods] are a way to group together a set of instructions that can be reused.
In Crystal methods are often defined in a class, module or struct.
But methods can also be defined outside of a class, module or struct.
Methods are declared using the `def` keyword, followed by the name of the method.
In Crystal methods should be written in snake_case.
When a method doesn't have any arguments, you can omit the parentheses.
To declare the end of a method, you must use the `end` keyword.

```crystal
def hello
  puts "Hello World!"
end
```

Using a method that doesn't exist on the type of the variable or method argument will result in a compile-time error.

```crystal
number = 1
number + "1"
```

```console
In test.cr:2:7

 2 | number + "1"
           ^
Error: no overload matches 'Int32#+' with type String
```

### Arguments

Methods can have [arguments][arguments].
Arguments are data that is passed to a method.
To be able to give a method arguments, you must specify the name of the argument.
In Crystal arguments should be written in snake_case.
A method can have multiple arguments, but the arguments must be separated by a comma.

```crystal
def hello(name)
  puts "Hello #{name}!"
end
```

Methods can also have multiple arguments.
In this case, the arguments must be separated by a comma.

```crystal
def hello(name, language)
  puts "Hello #{name}! You are learning #{language}."
end
```

### Calling Methods

When calling a method that belongs to a class, module or struct, you must use the dot operator(`.`).
Like following: `<ClassName>.<method_name>`.
When the method doesn't belong to a class, module or struct, then you can simple call it by writing its name.
Methods always implicitly return the value of the last expression in the method.

When a method has arguments, you may use parentheses when specifying the arguments in the method call and definition, like following: `<method_name>(<argument_1>, <argument_2>)`.
When a method has no arguments, parentheses should be omitted.

```crystal
def hello(name)
  "Hello #{name}!"
end

hello("Crystal")
# => Hello Crystal!
```

When calling a method with multiple arguments, the arguments should be separated by a comma.
The arguments must be given in the same order as the method arguments.

```crystal
def hello_language(name, language)
  puts "Hello #{name}! You are learning #{language}."
end

hello_language("World", "Crystal")
# => Hello World! You are learning Crystal.
```

Calling a method with the wrong number of arguments will result in a compile-time error.

```crystal
hello_language("Crystal")
```

```console
In test.cr:1:1

 1 | hello_language("Crystal")
     ^----
Error: wrong number of arguments for 'hello_language' (given 1, expected 2)
```

### Addition & Subtraction & Multiplication

In Crystal, you can use the `+` operator to add two numbers together.
You can also use the `-` operator to subtract two numbers.
And you can use the `*` operator to multiply two numbers.

```crystal
1 + 1
# => 2

2 - 1
# => 1

2 * 2
# => 4
```

### Comments

In Crystal [comments][comments] are written with the `#` character, followed by a space and then the comment.
Comments are used to document code.
Comments are not executed by the compiler.

```crystal
# This is a comment
```

[arguments]: https://crystal-lang.org/reference/latest/tutorials/basics/60_methods.html#arguments
[assignement]: https://crystal-lang.org/reference/latest/syntax_and_semantics/assignment.html#assignment
[comments]: https://crystal-lang.org/reference/latest/syntax_and_semantics/comments.html
[constants]: https://crystal-lang.org/reference/latest/syntax_and_semantics/constants.html
[default_arguments]: https://crystal-lang.org/reference/latest/tutorials/basics/60_methods.html#default-arguments
[methods]: https://crystal-lang.org/reference/latest/tutorials/basics/60_methods.html#methods
[return]: https://crystal-lang.org/reference/latest/tutorials/basics/60_methods.html#returning-a-value
[snake-case]: https://en.wikipedia.org/wiki/Snake_case
[type]: https://crystal-lang.org/reference/latest/tutorials/basics/20_variables.html#type
[variables]: https://crystal-lang.org/reference/latest/tutorials/basics/20_variables.html

## Instructions

In this exercise you're going to write some code to help you cook a brilliant lasagna from your favorite cooking book.

You have four tasks, all related to the time spent cooking the lasagna.

## 1. Define the expected oven time in minutes

Define the `EXPECTED_MINUTES_IN_OVEN` constant in the `Lasagna` class, that stores how many minutes the lasagna should be in the oven.
According to the cooking book, the expected oven time in minutes is 40:

```Crystal
Lasagna::EXPECTED_MINUTES_IN_OVEN
# => 40
```

## 2. Calculate the remaining oven time in minutes

Define the `Lasagna#remaining_minutes_in_oven` method that takes the actual minutes the lasagna has been in the oven as a parameter and returns how many minutes the lasagna still has to remain in the oven, based on the expected oven time in minutes from the previous task.

```Crystal
Lasagna.new.remaining_minutes_in_oven(30)
# => 10
```

## 3. Calculate the preparation time in minutes

Define the `Lasagna#preparation_time_in_minutes` method that takes the number of layers you added to the lasagna as a parameter and returns how many minutes you spent preparing the lasagna, assuming each layer takes you 2 minutes to prepare.

```Crystal
Lasagna.new.preparation_time_in_minutes(2)
# => 4
```

## 4. Calculate the total working time in minutes

Define the `Lasagna#total_time_in_minutes` method that takes two named parameters: the `number_of_layers` parameter is the number of layers you added to the lasagna, and the `actual_minutes_in_oven` parameter is the number of minutes the lasagna has been in the oven.
The method should return how many minutes in total you've worked on cooking the lasagna, which is the sum of the preparation time in minutes, and the time in minutes the lasagna has spent in the oven at the moment.

```Crystal
number_of_layers = 3
actual_minutes_in_oven = 20
Lasagna.new.total_time_in_minutes(number_of_layers, actual_minutes_in_oven)
# => 26
```

## Source

### Created by

- @meatball133

### Contributed to by

- @ErikSchierboom
- @angelikatyborska
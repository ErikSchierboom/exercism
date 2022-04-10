# Simple Calculator

Welcome to Simple Calculator on Exercism's Ruby Track.
If you need help running the tests or submitting your code, check out `HELP.md`.
If you get stuck on the exercise, check out `HINTS.md`, but try and solve it without using those first :)

## Introduction

Exceptions in Ruby, as in many languages, provide a way of dealing with unexpected events. Proper handling of exceptions is important when trying to prevent your program from crashing.

When an exception is raised, either by raising it explicitly or by the Ruby interpreter raising it, the program diverts normal operation and eventually exits with an error message:

```ruby
raise ArgumentError.new("Something went wrong!")
=> Traceback (most recent call last):
.
.
ArgumentError (Something went wrong!)
```

```ruby
1/0
=> Traceback (most recent call last):
.
.
ZeroDivisionError (divided by 0)
```

In case we want to stop this shut down process we need to react to the exception. This is called "rescuing" an exception:

```ruby
begin
  # ...any code that raises an exception
rescue
  puts 'Got an exception'
end
```

This program will not crash and it'll output "Got an exception". Instead of exiting, Ruby runs the code in the rescue block, which prints out a message.

As everything in Ruby, exceptions are also objects and they usually hold data about the exception. This is how we can get the exception object:

```ruby
begin
  # ...any code that raises an exception
rescue => e
  puts "Exception class: #{ e.class.name }"
  puts "Exception Message:#{e.message}"
end
```

In Ruby it's also possible to raise your own exceptions. For example:

```ruby
begin
  raise ArgumentError.new("Invalid argument")
rescue ArgumentError => e
  puts e.message
end
```

The previous exception is one of the Ruby's built in exceptions but it's also possible to define custom exceptions and raise them:

```ruby
class CustomError < StandardError
end

raise CustomError.new("Something went wrong")
```

## Instructions

In this exercise you will be building error handling for a simple calculator.

The goal is to have a working calculator that returns a string with the following pattern: `16 + 51 = 67`, when provided with arguments `16`, `51` and `+`.

```ruby
SimpleCalculator.calculate(16, 51, "+")
# => "16 + 51 = 67"
SimpleCalculator.calculate(32, 6, "*")
# => "32 * 6 = 192"
SimpleCalculator.calculate(512, 4, "/")
# => "512 / 4 = 128"
```

## 1. Handle the code that may raise errors within the method `calculate`

The main method for implementation in this task will be the class method `SimpleCalculator.calculate()` method.
It takes three arguments.
The first two arguments are numbers on which an operation is going to be conducted.
The third argument is of type string and for this exercise it is necessary to implement the following operations:

- addition using the `+` string
- multiplication using the `*` string
- division using the `/` string

## 2. Handle illegal operations

Update the `SimpleCalculator.calculate()` method to raise an `UnsupportedOperation` exception for unknown operation symbols.

```ruby
SimpleCalculator.calculate(1, 2, '-')
# => Raises an UnsupportedOperation
```

## 3. Handle invalid arguments

Update the `SimpleCalculator.calculate()` method to raise an `ArgumentError` exception for invalid argument types.

```ruby
SimpleCalculator.calculate(1, '2', '*')
# => Raises an ArgumentError
```

## 4. Handle DivideByZero exceptions

Update the `SimpleCalculator.calculate()` to handle `ZeroDivisionError` exceptions.
The handling code should return the string with the content `Division by zero is not allowed.`.
Any other exception should not be handled by the `SimpleCalculator.calculate()` method.

```ruby
SimpleCalculator.calculate(512, 0, "/")
# => returns "Division by zero is not allowed."
```

## Source

### Created by

- @pvcarrera
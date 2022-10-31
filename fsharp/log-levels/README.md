# Log Levels

Welcome to Log Levels on Exercism's F# Track.
If you need help running the tests or submitting your code, check out `HELP.md`.
If you get stuck on the exercise, check out `HINTS.md`, but try and solve it without using those first :)

## Introduction

A `string` in F# is an object that represents immutable text as a sequence of Unicode characters (letters, digits, punctuation, etc.) and is defined as follows:

```fsharp
let fruit = "Apple"
```

Strings are manipulated by either calling the string's methods, or using the `String` module's functions. Once a string has been constructed, its value can never change. Any methods/functions that appear to modify a string will actually return a new string.

Strings can be concatenated or formatted a few different ways.
* You can use the `+` operator for concatenation:
```fsharp
let sentence = "Apple" + " is a type of fruit."
```
* You can use the `sprintf` function for formatting text, where you have placeholders in a format text (`%s` for a `string`) and provide the values as arguments:
```fsharp
let sentence = sprintf "%s is a type of %s." "Apple" "fruit"
```

## Instructions

In this exercise you'll be processing log-lines.

Each log line is a string formatted as follows: `"[<LEVEL>]: <MESSAGE>"`.

There are three different log levels:

- `INFO`
- `WARNING`
- `ERROR`

You have three tasks, each of which will take a log line and ask you to do something with it.

## 1. Get message from a log line

Implement the `message` function to return a log line's message:

```fsharp
message "[ERROR]: Invalid operation"
// => "Invalid operation"
```

Any leading or trailing white space should be removed:

```fsharp
message "[WARNING]:  Disk almost full\r\n"
// => "Disk almost full"
```

## 2. Get log level from a log line

Implement the `logLevel` function to return a log line's log level, which should be returned in lowercase:

```fsharp
logLevel "[ERROR]: Invalid operation"
// => "error"
```

## 3. Reformat a log line

Implement the `reformat` function that reformats the log line, putting the message first and the log level after it in parentheses:

```fsharp
reformat "[INFO]: Operation completed"
// => "Operation completed (info)"
```

## Source

### Created by

- @ErikSchierboom
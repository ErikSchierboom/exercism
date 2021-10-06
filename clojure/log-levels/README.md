# Log Levels

Welcome to Log Levels on Exercism's Clojure Track.
If you need help running the tests or submitting your code, check out `HELP.md`.
If you get stuck on the exercise, check out `HINTS.md`, but try and solve it without using those first :)

## Introduction

A `string` in Clojure is a Java string, which is an object that represents immutable text as a sequence of Unicode characters (letters, digits, punctuation, etc.) and is defined as follows:

```clojure
(def fruit "Apple")
```

The `clojure.string` library provides many standard string manipulation and processing functions. In addition, all the usual Java methods for operating on strings are available via interop.

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

```clojure
(message "[ERROR]: Invalid operation")
;;=> "Invalid operation"
```

Any leading or trailing white space should be removed:

```clojure
(message "[WARNING]:  Disk almost full\r\n")
;;=> "Disk almost full"
```

## 2. Get log level from a log line

Implement the `log-level` function to return a log line's log level, which should be returned in lowercase:

```clojure
(log-level "[ERROR]: Invalid operation")
;;=> "error"
```

## 3. Reformat a log line

Implement the `reformat` function that reformats the log line, putting the message first and the log level after it in parentheses:

```clojure
(reformat "[INFO]: Operation completed")
;;=> "Operation completed (info)"
```

## Source

### Created by

- @porkostomus
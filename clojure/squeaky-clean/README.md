# Squeaky Clean

Welcome to Squeaky Clean on Exercism's Clojure Track.
If you need help running the tests or submitting your code, check out `HELP.md`.
If you get stuck on the exercise, check out `HINTS.md`, but try and solve it without using those first :)

## Introduction

## Character operations

Clojure characters are `java.lang.Character` primitives, and we can manipulate them via [interop][clojure-java-interop] using the methods in the [Character class][java-character-class]:

```clojure
(Character/isDigit \2)
;;=> true
```

## String utilities

Clojure ships with a powerful string processing library, [clojure.string][clojure-str]. This is often more idiomatic than interop.

[clojure-str]: https://clojuredocs.org/clojure.string
[clojure-java-interop]: https://clojure.org/reference/java_interop
[java-character-class]: https://docs.oracle.com/en/java/javase/17/docs/api/java.base/java/lang/Character.html

## Instructions

In this exercise you will implement a partial set of utility routines 
to help a developer clean up identifier names.

In the 5 tasks you will gradually build up the routine `clean`. 
A valid identifier comprises zero or more letters and underscores.

In all cases the input string is guaranteed to be non-nil. 
If an empty string is passed to the `clean` function, 
an empty string should be returned.

Note that the caller should avoid calling the routine `clean` 
with an empty identifier since such identifiers are ineffectual.

## 1. Replace any spaces encountered with underscores

Implement the `clean` function to replace any spaces with underscores. 
This also applies to leading and trailing spaces.

```clojure
(clean "my   Id")
;;=> "my___Id"
```

## 2. Replace control characters with the upper case string "CTRL"

Modify the `clean` function to replace control characters with 
the upper case string `"CTRL"`. 
A character is considered to be an ISO control character if 
its code is in the range '\u0000' through '\u001F' 
or in the range '\u007F' through '\u009F'.

```clojure
(clean "my\u007FId")
;;=> "myCTRLId"
```

## 3. Convert kebab-case to camelCase

Modify the `clean` function to convert kebab-case to camelCase.

```clojure
(clean "à-ḃç")
;;=> "àḂç"
```

## 4. Omit characters that are not letters

Modify the `clean` function to omit any characters that are not letters.
Note: The underscores must be preserved from the previous step.

```clojure
(clean "1😀2😀3😀")
;; => ""
```

## 5. Omit Greek lower case letters

Modify the `clean` function to omit any Greek letters in the range 'α' to 'ω'.

```clojure
(clean "MyΟβιεγτFinder")
;;=> "MyΟFinder"
```

## Source

### Created by

- @porkostomus
# Basics

Welcome to Basics on Exercism's AWK Track.
If you need help running the tests or submitting your code, check out `HELP.md`.
If you get stuck on the exercise, check out `HINTS.md`, but try and solve it without using those first :)

## Introduction

## Fundamentals

We'll refer to the _language_ as **AWK** and to the _executable_ that interprets AWK programs as **`awk`** or **`gawk`**.

### Patterns and Actions

An AWK program is composed of **pattern-action pairs**

```awk
pattern1 { action1 }
pattern2 { action2 }
...
```

A **pattern** can be a regular expression pattern to match against the input.
It can also be any expression that results in a true/false value.

An **action** is one or more AWK commands.
The enclosing braces are required.

If the result of the pattern is _true_, then the corresponding action is evaluated.

### Records and Fields

AWK parses the input as a series of **records**.
Each record is split into zero or more **fields**.

The default behaviour is to:

- split the input into records using newline as the "record separator", so each _line_ is a record.
- split the record into fields using whitespace as the "field separator", so each _word_ is a field.

### Patterns and Actions, continued

The pattern can be omitted, in which case the action is evaluated _for every input record_.

The action can be omitted, in which case the default action is to print the current record.

#### Special patterns

There are two special patterns that are often used.

- `BEGIN` will evaluate the associated action before any input is consumed.
- `END` will evaluate the associated action after all input is consumed.

### Field variables

You refer to fields as `$1`, `$2`, `$3`, etc.

The current record is `$0`.

Here are some other frequently used builtin variables.

#### Builtin variables that control input parsing

- `RS` is the input record separator.
  As mentioned, its default value is a newline.
- `FS` is the input field separator.

These variable are often set in the `BEGIN` action block.

#### Builtin variables that convey information

These variables are automatically set by AWK during execution of the program.

- `NF` stores the number of fields in the current record.
  - To get the value of the last field, use `$NF`.
- `NR` stores the current record number.
  - When multiple input files are being processed, `NR` will hold the total number of records processed so far.
- `FNR` stores the current record number of the current input file.
  - To illustrate the difference between NR and FNR, here is a common AWK idiom.
    ```awk
    NR == FNR {action}
    ```
    This means "if the accumulated record number equals the record number of the current file."
    This can only true for records in the _first input file_.

### Truthiness

AWK uses the same concept of truthiness as C.

- The number `0` is false.
- Any other number is true.

Since AWK is a text-processing language, truth values are extended to strings.

- An empty string `""` is false.
- Any non-empty string is true.

### Comments

Comments start with the `#` character and extend to the end of the line.

### Examples

On Unix-like systems `/etc/passwd` contains information about users.
Each user is described on a separate line, with fields separated by colons.

To list the usernames:

```sh
awk '
    BEGIN { FS = ":" }
    { print $1 }
' /etc/passwd
```

Notice that the `{print $1}` action has no pattern, so it is executed for every record.

If we want to limit the output to only users who use bash as their login shell, we can do:

```sh
awk '
    BEGIN { FS = ":" }
    $7 == "/bin/bash" { print $1 }
' /etc/passwd
```

## Instructions

Once upon a time, there was a bustling city called Cyberspace.
Cyberspace was a digital metropolis, with millions of inhabitants logging in and out every day.
To keep track of all these users, Cyberspace had a special file called /etc/passwd.

The /etc/passwd file was like a phonebook for the city.
It listed every user who had an account on the system, along with some important information about each user:

| n   | field |
| --- | --- |
| 1   | username |
| 2   | password ("x" indicates the actual password is stored elsewhere, for security) |
| 3   | UID, a unique numerical user ID |
| 4   | GID, a unique numerical group iD (typically the same as the UID) |
| 5   | user info (typically the user's full name, but can include other information) |
| 6   | home directory |
| 7   | login shell |

The fields are separated with a colon character.
This is a typical entry:

```none
glennj:x:1010:1010:Glenn Jackman:/home/glennj:/usr/local/bin/fish
```

The file was managed by a team of system administrators, who were responsible for creating new accounts, updating existing accounts, and removing old accounts.
The system administrators were the gatekeepers of Cyberspace, making sure that only authorized users could access the system.

One day, a new system administrator named Alex was hired to join the team.
Alex was excited to take on the job, and they quickly learned the ins and outs of the /etc/passwd file.
They learned how to add new users to the system, how to update user information, and how to remove old users.

As Alex was working on the /etc/passwd file, they noticed something strange.
Some users had strange or unusual home directories.
Some users had their home directories set to /dev/null, while others had their home directories set to strange paths that didn't exist.

Alex realized that these users were not real people, but rather fake accounts that had been created by hackers.
The hackers had found a way to exploit a vulnerability in the system, and had created these fake accounts to gain access to Cyberspace.

Alex knew that they needed to take action.
They used awk to analyze the /etc/passwd file, and wrote a script to identify all the fake accounts.
They then worked with the rest of the team to remove these accounts, and to patch the vulnerability that had allowed the hackers to create them in the first place.

Thanks to Alex's use of awk, the team was able to identify and remove the fake accounts, and to make Cyberspace a safer place for everyone.
The system administrators continued to manage the /etc/passwd file, keeping it up-to-date and secure, and ensuring that only authorized users could access the system.

Now, it's your turn to be a system administrator like Alex.

~~~~exercism/note
Here is some additional AWK syntax you'll need to solve this exercise.

* Boolean operators are similar to other languages:

    | operation | example            |
    | --------- | ------------------ |
    | AND       | `expr1 && expr2`   |
    | OR        | `expr1 \|\| expr2` |
    | NOT       | `! expr`           |

* Calling a function has familiar syntax:

    ```awk
    function greet(name) {
        print "Hello", name
    }
    BEGIN {
        greet("Mary")   # prints "Hello Mary"
    }
    ```

~~~~

## 1. List the usernames

Write an awk program to print the first colon-separated field for every line in the passwd file.

## 2. Print the line numbers

Write an awk command that prints the line number of each record in the input file.
Only print the line number, not any other information.

## 3. Print records with invalid home directories.

In Cyberspace, a "valid" home directory starts with `/home` or `/root`.
Print the records of the input file with **invalid** home directories.

## 4. Print the valid users who use bash

Print the records where the home directory is valid **and** the login shell is `bash`.

## Source

### Created by

- @glennj

### Based on

ChatGPT conversation
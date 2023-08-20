#!/bin/sh

# You will implement this exercise with a shell script that contains some awk commands.
# In subsequent exercises, the solution file will contains only awk code.
#
# You have 4 tasks to solve.
# Replace the `{exit}` action with awk code to solve the task.

## task 1
awk 'BEGIN { FS = ":" } { print $1 }' ./passwd

## task 2
awk '{ print NR }' ./passwd

## task 3
awk '
    # returns true if the text starts with the prefix
    # 
    #   startsWith("Hello, World!", "He")   # => true
    #   startsWith("Goodbye, Mars!", "He")  # => false
    #
    function startsWith(text, prefix) {
        return text ~ "^"prefix
    }

    ! startsWith($6, "/root") && ! startsWith($6, "/home")

    BEGIN { FS = ":" }
' ./passwd

## task 4
awk '
    function startsWith(text, prefix) {
        return text ~ "^"prefix
    }

    (startsWith($6, "/root") || startsWith($6, "/home")) && 
    $7 == "/bin/bash"

    BEGIN { FS = ":" }
' ./passwd

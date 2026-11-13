# Factory Sensors

Welcome to Factory Sensors on Exercism's Julia Track.
If you need help running the tests or submitting your code, check out `HELP.md`.
If you get stuck on the exercise, check out `HINTS.md`, but try and solve it without using those first :)

## Introduction

Programmers generally try to write perfect software, and generally fail.

Things go wrong, unexpectedly, and we need to be able to deal with that.

Some language designers believe that the priority is to detect an error as quickly as possible, then terminate execution with an informative message to aid debugging.

Data science languages tend to take a more nuanced approach.
Some errors are so serious that immediate termination is necessary, but often it is better to flag a problem as something to be dealt with later, then continue execution.

We saw in the [Nothingness][nothingness] Concept that Julia provides various placeholders for problematic values: `missing`, `NaN` and `Inf`.
Whether these are a better approach than program termination in a particular situation is a matter for programmer judgment.

_A point of nomenclature_ before getting into the details: the Julia documentation treats the words "error" and "exception" as largely interchangeable.
The content below may be equally inconsistent.

## Standard error types

By this point in the syllabus, you must have seen many error messages from Julia.
For example:

```julia-repl
julia> Int(3.14)
ERROR: InexactError: Int64(3.14)
```

Trying to cast a float to an integer involves a loss of precision, so we get an `InexactError`.

`InexactError` is a type, one of several ([currently 25][errors]) built into Julia as standard.
All are subtypes of `Exception`:

```julia-repl
julia> supertype(InexactError)
Exception
```

## `throw()`

Some of the standard error types might be useful to generate in your own code.

Like all concrete types, the errors have constructors.
They take a variety of arguments, so check the [documentation][errors] for the one you want to use.

```julia-repl
julia> DomainError(42, "out of range")
DomainError(42, "out of range")
```

To use the error, wrap the constructor in a `throw()` function:

```julia-repl
julia> throw(DomainError(42, "out of range"))
ERROR: DomainError with 42:
out of range
```

## `error()`

For a quick-and-dirty approach, the `error()` function can be convenient.
It takes a string (or the components of a string) as argument:

```julia-repl
julia> happy = false;
julia> happy || error("😞 something went wrong")
ERROR: 😞 something went wrong
```

## Custom errors

Creating new error types is in principle very easy.
Just add another subtype of `Exception`:

```julia-repl
julia> struct MyError <: Exception end

julia> throw(MyError)
ERROR: MyError
```

## Assertions

The basic idea of an assertion is "this statement ought to be true, so complain loudly if it is false."
The value of this is mainly during debugging, as production code should never fail an assertion.

We saw in the [Types][types] Concept that we can add type assertions, for example to check the return type of a function.

```julia-repl
julia> 42::Number
42

julia> "two"::Number
ERROR: TypeError: in typeassert, expected Number, got a value of type String
```

More generally, the `@assert` macro lets us test any expression that evaluates to a boolean:

```julia-repl
julia> n = 22;
julia> @assert isodd(n) "n must be odd"
ERROR: AssertionError: n must be odd
```

## `try`...`catch`

Some errors are necessarily fatal, but often we expect the program to recover gracefully.

By default, an error immediately terminates the current function, and the error (with any informative message) is passed to the calling function.

This continues up the call stack, until the top-level code terminates with an error message.

At any stage, the error can be intercepted with a `try...catch` block which attempts to handle it.

```julia-repl
julia> n = -1;
julia> try
           log_n = log(n)
       catch problem
           if problem isa DomainError # number out of range
               # See next section for more on @warn and @info
               @warn "you may have supplied a negative real number: $n"
               @info "trying with complex argument"
               log_n = log(Complex(n))  # fallback calculation

           elseif problem isa MethodError # no idea what n is
               @error "please supply a valid argument"

           else
              rethrow() # the error could be anything else
           end
      end
┌ Warning: you may have supplied a negative real number: -1
└ @ Main REPL[3]:5
[ Info: trying with complex argument
0.0 + 3.141592653589793im  # success
```

In the example above, `log(n)` needs `n` to be either a positive real value, or any complex value.
The `try ... catch` traps problems with negative real values, returning the correct complex answer `iπ` in mathematical notation.

If you supply, for example, a string argument, there is no recovery except asking the user to correct it.

As a final catch-all, we added `rethrow()` for anything which is neither `DomainError` nor `MethodError`.

***Note:*** Sometimes a `try...catch` is what you need, but please avoid over-using it.
If an `if...else` block can be used instead, it will be much more performant than catching exceptions.

## Logging

Note that the `error()` function, discussed above, should not be confused with the `@error` macro.

The function generates an exception, which will be passed up the call stack unless caught.

The `@error` macro, along with its `@debug`, `@info` and `@warn` counterparts, is part of the `Logging` module, and intended to generate informative messages without altering program flow.

Output goes to the terminal by default (color-coded by severity), though in a real application there are many other possibilities.

```julia-repl
julia> @warn "Something looks not quite right"
┌ Warning: Something looks not quite right
└ @ Main REPL[55]:1

julia> @error "Panic!"
┌ Error: Panic!
└ @ Main REPL[56]:1
```

See also the previous example, under `try...catch`.


[nothingness]: https://exercism.org/tracks/julia/concepts/nothingness
[errors]: https://docs.julialang.org/en/v1/manual/control-flow/#Built-in-Exceptions
[types]: https://exercism.org/tracks/julia/concepts/types

## Instructions

Elena is the new quality manager of a newspaper factory.
As she has just arrived in the company, she has decided to review some of the processes in the factory to see what could be improved.
She found out that technicians are doing a lot of quality checks by hand. She sees there is a good opportunity for automation and asks you, a freelance developer, to develop a piece of software to monitor some of the machines.

## 1. Check the humidity level of the room

Your first mission is to write a piece of software to monitor the humidity level of the production room. There is already a sensor connected to the software of the company that returns periodically the humidity percentage of the room.

You need to implement a function in the software that will throw an error if the humidity percentage is too high.
If the humidity is at an acceptable level, an info log will be added.
The function should be called `humiditycheck` and take the humidity percentage as an argument.

You should halt with an ErrorException (the exact message is not important, but must contain the measured humidity level) if the percentage exceeds 70%.
Otherwise, add an Info log, with the message `"humidity level check passed: h%"`, where `h` is the humidity percentage.

```julia-repl
julia> humiditycheck(60)
[ Info: humidity level check passed: 60%
```

```julia-repl
julia> humiditycheck(100)
ERROR: humidity check failed: 100%
```

## 2. Check for overheating

Elena is very pleased with your first assignment and asks you to deal with the monitoring of the machines' temperature.
While chatting with a technician, Greg, you are told that if the temperature of a machine exceeds 500°C, the technicians start worrying about overheating.

The machine is equipped with a sensor that measures its internal temperature.
You should know that the sensor is very sensitive and often breaks.
In this case, the technicians will need to change it.

Your job is to implement a function `temperaturecheck` that takes the temperature as an argument and either adds a log if all is well or throws an error if the sensor is broken or if the machine starts overheating.
Knowing that you will later need to react differently depending on the error, you need a mechanism to differentiate the two kinds of errors.

- If the sensor is broken, the temperature will be `nothing`.
  In this case, you should halt with an `ArgumentError` (the message is not important).
- When the sensor is working, if the temperature exceeds 500°C, you should throw a `DomainError` that includes the measured temperature.
- Otherwise, all is well, so add an Info log with the message `"temperature check passed: t °C"`, where `t` is the temperature.

```julia-repl
julia> temperaturecheck(nothing)
ERROR: ArgumentError: sensor is broken

julia> temperaturecheck(800)
ERROR: DomainError with 800:
"overheating detected"

julia> temperaturecheck(500)
[ Info: temperature check passed: 500 °C
```

## 3. Define custom error

For the next task, you will need to define a more general, catch-all error.
The implementation details are not important beyond it being an error and the name being `MachineError`.
You can feel free to include fields and messages as you find helpful.

## 4. Monitor the machine

Now that your machine can detect errors and you have a custom machine error, you add a wrapper function that can report how everything is working.
Beyond returning the logs from the previous functions, this wrapper will also need to add logs depending on any type(s) of failure(s) that occur.

- Check the humidity and temperature.
- If the humidity check throws an `ErrorException`, an Error log should be added with the message, `"humidity level check failed: h%"`, where `h` is the humidity percentage.
- If the temperature check throws an `ArgumentError`, a Warn log should be added with the message `"sensor is broken"`.
- If the temperature check throws a `DomainError`, an Error log should be added with the message, `"overheating detected: t °C"`, where `t` is the temperature.
- If either or both of the checks fail, a single `MachineError` should be thrown after the logs are added.
- If all is well, only the logs from `humiditycheck` and `temperaturecheck` will be added.

Implement a function `machinemonitor()` that takes humidity and temperature as arguments.

```julia-repl
julia> machinemonitor(42, 450)
[ Info: humidity level check passed: 42%
[ Info: temperature check passed: 450 °C

julia> machinemonitor(42, 550)
[ Info: humidity level check passed: 42%
┌ Error: overheating detected: 550 °C
└ @ Main # output truncated

Error: MachineError

julia> machinemonitor(82, 521)
┌ Error: humidity level check failed: 82%
└ @ Main # output truncated
┌ Error: overheating detected: 521 °C
└ @ Main # output truncated

Error: MachineError

julia> machinemonitor(42, nothing)
[ Info: humidity level check passed: 42%
┌ Warning: sensor is broken
└ @ Main # output truncated

Error: MachineError
```

## Source

### Created by

- @colinleach
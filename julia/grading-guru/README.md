# Grading Guru

Welcome to Grading Guru on Exercism's Julia Track.
If you need help running the tests or submitting your code, check out `HELP.md`.
If you get stuck on the exercise, check out `HINTS.md`, but try and solve it without using those first :)

## Introduction

So far, the syllabus has not said much about types, but clearly they exist in Julia:

```julia-repl
julia> vals = (42, 4.3, π, "hello", 'Q')
(42, 4.3, π, "hello", 'Q')
julia> typeof(vals)
Tuple{Int64, Float64, Irrational{:π}, String, Char}
```

We never specified the types, but Julia assigned them regardless.

1. Julia has `types`, which are central to its design.
2. Julia can usually "guess" the type, using `Type Inference`.

The JIT compiler will look through (all) the code, see how a variable is used, and _infer_ a suitable default type compatible with that usage.

## Type assignment

Relying on type inference is fine for solving simple tutorial exercises, but for bigger programs you are likely to need more precise control.

On most modern processors, an integer defaults to `Int64`.
We saw in the `Numbers` Concept that a value can be converted to a particular non-default type.

```julia-repl
julia> x = Int16(42)
42
julia> typeof(x)
Int16
```

However, the variable `x` can still be reassigned to a different type:

```julia-repl
julia> x = "changed"
"changed"
julia> typeof(x)
String
```

This is `type instability`, which is:

- Very convenient in small scripts.
- Bad for performance and reliability in bigger programs.

Instead, we can set the type of `x` by using the `::` operator:

```julia-repl
julia> y::Int16 = 42
42
julia> typeof(y)
Int16
julia> y = "changed"
ERROR: MethodError: Cannot `convert` an object of type String to an object of type Int16
The function `convert` exists, but no method is defined for this combination of argument types.
```

Now `y` is, and always will be, of type `Int16`.
Thus, the compiler knows how many bytes to reserve for it, and can optimize the rest of the code to rely on a stable type.
In this, the variable is more or less similar to those in a statically-typed language such as C.

## The Type Hierarchy

`Int64`, `Int16`, `String`, `Char`: where do these types _"come from"_?

In many object-oriented (OO) languages, each type is a class, subclassing arranges them in a class hierarchy, and class methods define the behaviors.

Java and Ruby are obvious examples of this pattern, but even Python is similar internally.

***Julia has no classes.***

The documented reason is that OO features interfere with the JIT compiler and hurt runtime performance.

And yet, look at this code:

```julia-repl
julia> y::Int16 = 42
42
julia> typeof(y)
Int16
julia> supertype(Int16)
Signed
julia> supertypes(Int16)
(Int16, Signed, Integer, Real, Number, Any)
```

Filling in some details:

- `Int16` is a type, and we can create variables of this type.
- `Int16` is a subtype of `Signed`, and the `supertype()` function shows us this.
- There is a hierarchy of types, going up through `Integer`, `Real` and `Number` to `Any` at the top, and `subtypes()` will list this branch of the hierarchy for us.

All branches end in `Any`, which is unique in being its own supertype.

```julia-repl
julia> supertypes(String)
(String, AbstractString, Any)
julia> supertype(Any)
Any
```

So, Julia has no `class` hierarchy, but it _does_ have a `type` hierarchy.

Eventually, we will try to unpick how this works, but there is much more to explore first.

## Testing for Types

We can use `typeof()` to test for equality in the usual way.

```julia-repl
julia> typeof(11)
Int64
julia> typeof(11) == Int64
true
julia> typeof(11) == Number
false
```

The type equality must be exact, as this form of comparison has no understanding of the type hierarchy.

More flexibly, `isa` will tell us if a value has either the same type as a comparator, or a subtype of it.
It can be used in either function or infix form.

```julia-repl
julia> 12 isa Int64
true
julia> 12 isa Number
true
julia> isa(12, Number)
true
julia> 12 isa String
false
```

Note that `isa` expects a `value` on the left, not a `type`.

Trying to compare two _types_ this way will give unexpected results.
The correct operator is `<:`, which we will see a lot more of in future concepts.

```julia-repl
julia> Int64 isa Number  ## Don't do this!
false
julia> Int64 <: Number
true
```

## Abstract versus Concrete Types

We saw that the type hierarchy forms a tree structure (in the CS sense, with the root at the top).

Each item in the tree is a `node`, and these can be divided into categories:

1. Nodes with subtypes are called `abstract`.
2. Leaf nodes, with no subtypes, are called `concrete`.

```julia-repl
julia> subtypes(Integer)  # an abstract type
3-element Vector{Any}:
 Bool
 Signed
 Unsigned
julia> subtypes(Int64)  # a concrete type
Type[]
```

This is an important distinction, because only concrete types can be `instantiated` as variables.

```julia-repl
julia> a::Int16 = 42
42
julia> typeof(a)
Int16
julia> b::Integer = 42
42
julia> typeof(b)
Int64
```

Note that trying to use an abstract type gives no error message (in this case), but the compiler creates an appropriate concrete type: `Int64` instead of `Integer`.

## Instructions

In this exercise, you are going to do a bit of data engineering by preprocessing some grading data.
A school with many, many, many (too many?) students is trying to do some data analysis on the grades received by students and is looking to do so efficiently, so the idea is to minimize and organize the data.

The grading scale is usually from 0-10, so it is most efficient to use a data type with only eight bits per grade.
- Some professors use real numbers (as they are sticklers for precision), and you will need to convert these to the `UInt8` data type.
- Other professors use integers with negative numbers (to punish especially unruly students), and you will need to convert these to the `Int8` data type in these situations.

Once you have implemented the function to convert the grades, you will need to write another to handle the collections that they are held in by demoting the grades and returning them in descending order.
- Some professors use `Vector`s sorted in ascending order to store their grades, because they are meticulous about their data.
- Other professors use `Set`s, which are unsorted, to store their grades, because they are a bit lazier.

In both functions, you will need to handle invalid inputs by throwing a MethodError.

~~~~exercism/note
Exception handling will be covered in a later Concept, so for the purposes of this exercise, you can use the following syntax:
```julia
throw(MethodError(f, args))
```
Where `f` is the function, and `args` is a tuple of the arguments input into the function.
With the `demote(n)` function, `f` is `demote` and `args` is `(n,)`:
```julia
throw(MethodError(demote, (n,)))
```
~~~~

## 1. Demote the grades

Implement the `demote(n)` method.
- With a `Float64` input, it should round up to the nearest whole number and return a `UInt8` data type.
- With an arbitrary `Integer`, it should return the same integer in an `Int8` data type.
- All other inputs should throw a MethodError.

```julia-repl
julia> demote(4.2)::UInt8
5

julia> demote(4)::Int8
4

julia> demote("hi")
MethodError: no method matching demote(::String)     #output truncated
```

## 2. Preprocess the data

Implement the `preprocess(coll)` method.
- With a `Vector` input, it should demote all the numbers and reverse the vector.
- With a `Set` input, it should demote all the numbers and return a sorted vector in descending order.
- All other inputs should throw a MethodError.

```julia-repl
julia> preprocess([1, 2, 3])
3-element Vector{Int8}:
 3
 2
 1

julia> preprocess(Set([2.2, 5.8, 3.4]))
3-element Vector{UInt8}:
 6
 4
 3

julia> preprocess(42)
MethodError: no method matching preprocess(::Int64)     #output truncated
```

## Source

### Created by

- @depial
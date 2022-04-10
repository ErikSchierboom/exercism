# Bird Count

Welcome to Bird Count on Exercism's Ruby Track.
If you need help running the tests or submitting your code, check out `HELP.md`.
If you get stuck on the exercise, check out `HINTS.md`, but try and solve it without using those first :)

## Introduction

## Arrays

In Ruby, **arrays** are ordered, integer-indexed collections of any object.
Array indexing starts at `0`.
A negative index is assumed to be relative to the end of the array — e.g.. an index of `-1` indicates the last element of the array, `-2` is the next to last element in the array, and so on.

### Creating arrays

Arrays are normally created using the `[]` notation.
They can create any different type of object.

```ruby
array = [1, "two", 3.0]
```

### Element Reference

Elements in an array can be retrieved by their indexes using the `#[]` method.
This returns the element at index, or returns a subarray starting at the start index and continuing for a specified length.
Negative indices count backward from the end of the array.

```ruby
a = [ "a", "b", "c", "d", "e" ]

a[2]       #=> "c"
a[6]       #=> nil
a[1, 3]    #=> [ "b", "c", "d" ]

a[-1]      #=> "e"
a[-2]      #=> "d"
a[-3, 2]   #=> ["c", "d"]
```

### Helper Methods

There are lots of useful helper methods on arrays.
Here are some of the more common:

```ruby
fibonacci = [0, 1, 1, 2, 3, 5, 8, 13]

fibonacci.size      #=> 8
fibonacci.sum       #=> 33
fibonacci.reverse   #=> [13, 8, 5, 3, 2, 1, 1, 0]
```

## Enumeration

Rather than using loops to iterate through collections, in Ruby we use enumeration.

Enumeration is the act of stepping through a collection (in this case an array) and performing some action on each object.  Enumeration is a key concept in Ruby and is used for things like sorting, grouping, mapping, reducing, and much more.

An enumeration to print each word in an array would look like this:

```ruby
words = ["the", "cat", "sat"]
words.each do |word|
  puts word
end

# Output:
# the
# cat
# sat
```

In this example, we have called the `.each` method on our array and passed in a _block_ that takes one parameter (`word`) and prints it out.

We'll look at _blocks_ in much more depth later in the Track, but for now think of them as anonymous functions that can take zero or more arguments.
They can be defined using the `do...end` syntax (above), or the `{}` syntax (below).

Here are some other examples of array methods that use blocks:

```ruby
fibonacci = [0, 1, 1, 2, 3, 5, 8, 13]

fibonacci.count  { |number| number == 1 }   #=> 2
fibonacci.any?   { |number| number == 6 }   #=> false
fibonacci.select { |number| number.odd? }   #=> [1, 1, 3, 5, 13]
fibonacci.all?   { |number| number < 20 }   #=> true
fibonacci.map    { |number| number * 2  }   #=> [0, 2, 2, 4, 6, 10, 16, 26]
```

## Instructions

You're an avid bird watcher that keeps track of how many birds have visited your garden in the last seven days.

You have five tasks, all dealing with the numbers of birds that visited your garden.

## 1. Check what the counts were last week

For comparison purposes, you always keep a copy of last week's counts nearby, which were: 0, 2, 5, 3, 7, 8 and 4. Implement the `BirdCount.last_week` method that returns last week's counts:

```ruby
BirdCount.last_week
# => [0, 2, 5, 3, 7, 8, 4]
```

## 2. Check how many birds visited yesterday

Implement the `BirdCount#yesterday` method to return how many birds visited your garden yesterday. The bird counts are ordered by day, with the first element being the count of the oldest day, and the last element being today's count.

```ruby
birds_per_day = [2, 5, 0, 7, 4, 1]
bird_count = BirdCount.new(birds_per_day)
bird_count.yesterday
# => 4
```

## 3. Calculate the total number of visiting birds

Implement the `BirdCount#total` method to return the total number of birds that have visited your garden:

```ruby
birds_per_day = [2, 5, 0, 7, 4, 1]
bird_count = BirdCount.new(birds_per_day)
bird_count.total
# => 19
```

## 4. Calculate the number of busy days

Some days are busier than others. A busy day is one where five or more birds have visited your garden.
Implement the `BirdCount#busy_days` method to return the number of busy days:

```ruby
birds_per_day = [2, 5, 0, 7, 4, 1]
bird_count = BirdCount.new(birds_per_day)
bird_count.busy_days
# => 2
```

## 5. Check if there was a day with no visiting birds

Implement the `BirdCount#day_without_birds?` method that returns `true` if there was a day at which zero birds visited the garden; otherwise, return `false`:

```ruby
birds_per_day = [2, 5, 0, 7, 4, 1]
bird_count = BirdCount.new(birds_per_day)
bird_count.day_without_birds?
# => true
```

## Source

### Created by

- @pvcarrera
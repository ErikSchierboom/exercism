# Regular Chatbot

Welcome to Regular Chatbot on Exercism's Julia Track.
If you need help running the tests or submitting your code, check out `HELP.md`.
If you get stuck on the exercise, check out `HINTS.md`, but try and solve it without using those first :)

## Introduction

Regular expressions are a highly versatile way to _pattern match_ strings, using a Domain Specific Language (DSL) designed for the purpose.

Like several other programming languages, Julia makes no attempt to implement its own Regex library.
Instead, it wraps the popular [PCRE2][PCRE] library, thus providing a Regex syntax identical to (for example) Gleam, and very similar to JavaScript.

~~~~exercism/note
This Julia syllabus assumes that you are already familiar with basic Regex syntax.
We will concentrate solely on Julia-specific features.

Some resources to refresh your regular expression knowledge are listed below.
~~~~

- [Regex101][regex101]
- [RegExr][regexr]
- [RexEgg][rexegg]
- [RegexOne][regexone]
- [Regular Expressions Info][regex-info]

Julia's interface to regular expressions is described in the [manual][regex].

A regular expression in Julia is simply a string prefaced by `r` before the opening `"`.
All the basic functionality is part of the standard library.

In fact, many of the functions already discussed in the [`Strings`][strings] Concept are designed for Regex searches as standard, such as `occursin()`.

```julia-repl
julia> re = r"test$"
r"test$"

julia> typeof(re)
Regex

# Does a string end with "test"?
julia> occursin(re, "this is a test")
true

julia> occursin(re, "these are tests")
false
```

Modifier characters can follow the closing quote, such as `i` for a case-insensitive match.

```julia-repl
julia> occursin(r"test", "Testing")
false

julia> occursin(r"test"i, "Testing")
true
```

## Captures

Commonly, we want to know _what_ matches. This is achieved by including capture groups in parentheses within the regex, then using the [`match()`][match] function.

```julia-repl
julia> m = match(r"(\d+g) .* (\d+ml)", "dissolve 25g sugar in 200ml water")
RegexMatch("25g sugar in 200ml", 1="25g", 2="200ml")

julia> m.captures
2-element Vector{Union{Nothing, SubString{String}}}:
 "25g"
 "200ml"

# how many matches?
julia> length(m.captures)
2

# what matched?
julia> m[1], m[2]
("25g", "200ml")

# Starting positions of the matches (character index)
julia> m.offsets
2-element Vector{Int64}:
 10
 23
```

Of course, matches can fail.
The result will then be the special value `nothing` instead of a `RegexMatch`, so be ready to test for this.

```julia-repl
# failed match
m = match(r"(not here)", "dissolve 25g sugar in 200ml water")

julia> typeof(m)
Nothing

julia> isnothing(m)
true
```

Though `match` defaults to starting at the beginning of the string, we can also specify an offset `n` to ignore the first `n` characters.

```julia-repl
# capture first match
julia> m = match(r"(\wat)", "cat, sat, mat")
RegexMatch("cat", 1="cat")

# ignore first 5 characters, then match
julia> m = match(r"(\wat)", "cat, sat, mat", 5)
RegexMatch("sat", 1="sat")
```

In Julia, `match()` will only find the _first_ match within the target string: there is no global modifier as in some other languages.

Instead, we have [`eachmatch()`][eachmatch], which returns an iterator of matches.
This is lazily evaluated, so you may need to convert it to your desired format.

```julia-repl
julia> matches = eachmatch(r"(\wat)", "cat, sat, mat")
Base.RegexMatchIterator{String}(r"(\wat)", "cat, sat, mat", false)

# convert to vector
julia> collect(matches)
3-element Vector{RegexMatch}:
 RegexMatch("cat", 1="cat")
 RegexMatch("sat", 1="sat")
 RegexMatch("mat", 1="mat")

# convert with comprehension
julia> [m.match for m in matches]
3-element Vector{SubString{String}}:
 "cat"
 "sat"
 "mat"

# broadcast an anonymous function
julia> (m -> m.match).(matches)
3-element Vector{SubString{String}}:
 "cat"
 "sat"
 "mat"
```

## Replace

One common reason to use a Regex is to replace the match with a different string.

The [`replace()`][replace] function was discussed in the [`Strings`][strings] Concept, using string literals to search on.
The same function can exploit the full power of Regex matching.

```julia-repl
julia> replace("some string", r"[aeiou]" => "*")
"s*m* str*ng"

julia> replace("first second", r"(\w+) (?<agroup>\w+)" => s"\g<agroup> \1")
"second first"
```

The second example above shows how both numbered and named capture groups can be used in the replacement, within an `s" "` string.

See the [manual][regex] for more details: this is a topic which constantly forces most programmers back to the documentation!



[regex]: https://docs.julialang.org/en/v1/manual/strings/#man-regex-literals
[PCRE]: https://www.pcre.org/current/doc/html/pcre2syntax.html
[strings]: https://exercism.org/tracks/julia/concepts/strings

[regex101]: https://regex101.com/
[regexr]: https://regexr.com/
[regex-info]: https://www.regular-expressions.info/
[rexegg]: https://www.rexegg.com/
[regexone]: https://regexone.com/

[occursin]: https://docs.julialang.org/en/v1/base/strings/#Base.occursin
[match]: https://docs.julialang.org/en/v1/base/strings/#Base.match
[eachmatch]: https://docs.julialang.org/en/v1/base/strings/#Base.eachmatch
[replace]: https://docs.julialang.org/en/v1/base/strings/#Base.replace-Tuple{IO,%20AbstractString,%20Vararg{Pair}}

## Instructions

You have been hired as a Regular Expression Specialist in a company that is developing a Chatbot.

It is in a very basic phase of development, hence your mission is to use Regular Expressions to improve the chatbot's ability to understand and generate natural language.

~~~~exercism/note
For learning purposes, please solve these tasks using Regular Expressions.

We know that alternatives are sometimes possible (and may even be more performant!)
~~~~

## 1. Check Valid Command

Apart from being smart, the Chatbot is also a loyal assistant.

To ask something to the chatbot, the user must say the word “**Chatbot**” in the first position of the command.

It doesn't matter if the keyword is in UPPERCASE or lowercase. The important aspect here is the position of the word.

Implement the function `is_valid_command()` that helps the Chatbot recognize when the user is giving a command.

```julia-repl
julia> is_valid_command("Chatbot, play a song from the 80's.")
True

julia> is_valid_command("Hey Chatbot, where is the closest pharmacy?")
False

julia> is_valid_command("CHATBOT, do you have a solution for this challenge?")
True
```

## 2. Remove Encrypted Emojis

The Chatbot has a difficult time understanding how humans use emojis to express their emotions.

When the chatbot receives user messages, each emoji is represented as “_emoji_” followed by its _id_ number.

Implement the `remove_emoji()` method to take a string and remove all the emoji’s encryption throughout the message.

Lines not containing emoji’s text should be returned unmodified.

Just remove the emoji string. Do not attempt to adjust the whitespace.

```julia-repl
julia> remove_emoji("I love playing videogames emoji3465 it's one of my hobbies")
"I love playing videogames  it's one of my hobbies"
```

## 3. Check Valid Phone Number

Considering the download of chatbot features on a mobile app, the user is expected to write a phone number during the conversation.

The problem is that the chatbot can only read and validate a number with a specific format.

If the number is valid (matches the character sequence specified by the **regular expression**), the chatbot answers with a message thanking the user and confirming the number. If the number is invalid, the function informs the user that the phone number is not valid.

The expected format is: (+##) ###-###-###

```julia-repl
julia> check_phone_number("(+34) 659-771-594")
"Thanks! You can now download me to your phone."

julia> check_phone_number("659-771-594")
"Oops, it seems like I can't reach out to 659-771-594"
```

## 4. Get Website Link

The Chatbot is a really curious software. Even though he can search on the internet about a particular topic, he likes to ask users about cool websites or URLs to go find relevant information.

Example of Conversation:

- **Chatbot**: Hey username, I would like to learn how to code in JavaScript, do you know any cool website where I could learn?
- **User**: I learned a lot from [exercism.org](http://exercism.org)

Implement the function `getURL()` which is able to return an array with just the link of each website.

```julia-repl
julia> getURL("I learned a lot from exercism.org")
["exercism.org"]
```

## 5. Greet the User

For storing data from all the persons who have had a conversation with, the chatbot is able to get the Full Name from the user’s profile in this style: **“smith, john”**.

In this way, we want our chatbot to be really polite and make a good impression.

Write the function `nice_to_meet_you()` that takes a string with the full name of the user, and returns the string **“Nice to meet you, John Smith”**

```julia-repl
julia> str = "Smith, John"

julia> nice_to_meet_you(str)
"Nice to meet you, John Smith"
```

## Source

### Created by

- @colinleach
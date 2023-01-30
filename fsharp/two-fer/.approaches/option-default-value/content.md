# `Option.defaultValue`

```fsharp
let twoFer nameOpt =
    let name = Option.defaultValue "you" nameOpt
    $"One for {name}, one for me."
```

We define a single `Speak()` method with one optional parameter: `name`.
This optional parameter has its default value set to the string `"you"`.

Within the method, we use [string interpolation][string-interpolation] to build the return string where `{name}` is replaced with the value of the `name` parameter.

## String formatting

The [string formatting article][article-string-formatting] discusses alternative ways to format the returned string.

[article-string-formatting]: https://exercism.org/tracks/fsharp/exercises/two-fer/articles/string-formatting

# Isogram

Welcome to Isogram on Exercism's Haskell Track.
If you need help running the tests or submitting your code, check out `HELP.md`.

## Instructions

Determine if a word or phrase is an isogram.

An isogram (also known as a "nonpattern word") is a word or phrase without a repeating letter, however spaces and hyphens are allowed to appear multiple times.

Examples of isograms:

- lumberjacks
- background
- downstream
- six-year-old

The word *isograms*, however, is not an isogram, because the s repeats.

This exercise works with textual data. For historical reasons, Haskell's
`String` type is synonymous with `[Char]`, a list of characters. For more
efficient handling of textual data, the `Text` type can be used.

As an optional extension to this exercise, you can

- Read about [string types](https://haskell-lang.org/tutorial/string-types) in Haskell.
- Add `- text` to your list of dependencies in package.yaml.
- Import `Data.Text` in [the following way](https://hackernoon.com/4-steps-to-a-better-imports-list-in-haskell-43a3d868273c):

        import qualified Data.Text as T
        import           Data.Text (Text)

- You can now write e.g. `isIsogram :: Text -> Bool` and refer to `Data.Text` combinators as e.g. `T.toLower`.
- Look up the documentation for [`Data.Text`](https://hackage.haskell.org/package/text/docs/Data-Text.html).

This part is entirely optional.

## Source

### Contributed to by

- @bitfield
- @iHiD
- @petertseng
- @ppartarr
- @sjwarner-bp
- @sshine
- @tejasbubane

### Based on

Wikipedia - https://en.wikipedia.org/wiki/Isogram
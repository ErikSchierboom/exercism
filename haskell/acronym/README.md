# Acronym

Welcome to Acronym on Exercism's Haskell Track.
If you need help running the tests or submitting your code, check out `HELP.md`.

## Instructions

Convert a phrase to its acronym.

Techies love their TLA (Three Letter Acronyms)!

Help generate some jargon by writing a program that converts a long name
like Portable Network Graphics to its acronym (PNG).

This exercise works with textual data. For historical reasons, Haskell's
`String` type is synonymous with `[Char]`, a list of characters. For more
efficient handling of textual data, the `Text` type can be used.

As an optional extension to this exercise, you can

- Read about [string types](https://haskell-lang.org/tutorial/string-types) in Haskell.
- Add `- text` to your list of dependencies in package.yaml.
- Import `Data.Text` in [the following way](https://hackernoon.com/4-steps-to-a-better-imports-list-in-haskell-43a3d868273c):

        import qualified Data.Text as T
        import           Data.Text (Text)

- You can now write e.g. `abbreviate :: Text -> Text` and refer to `Data.Text` combinators as e.g. `T.filter`.
- Look up the documentation for [`Data.Text`](https://hackage.haskell.org/package/text/docs/Data-Text.html).

This part is entirely optional.

## Source

### Created by

- @lpalma

### Contributed to by

- @alanvardy
- @iHiD
- @marionebl
- @navossoc
- @petertseng
- @ppartarr
- @rbasso
- @sharno
- @sshine
- @tejasbubane

### Based on

Julien Vanier - https://github.com/monkbroc
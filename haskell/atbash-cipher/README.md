# Atbash Cipher

Welcome to Atbash Cipher on Exercism's Haskell Track.
If you need help running the tests or submitting your code, check out `HELP.md`.

## Instructions

Create an implementation of the atbash cipher, an ancient encryption system created in the Middle East.

The Atbash cipher is a simple substitution cipher that relies on
transposing all the letters in the alphabet such that the resulting
alphabet is backwards. The first letter is replaced with the last
letter, the second with the second-last, and so on.

An Atbash cipher for the Latin alphabet would be as follows:

```text
Plain:  abcdefghijklmnopqrstuvwxyz
Cipher: zyxwvutsrqponmlkjihgfedcba
```

It is a very weak cipher because it only has one possible key, and it is
a simple monoalphabetic substitution cipher. However, this may not have
been an issue in the cipher's time.

Ciphertext is written out in groups of fixed length, the traditional group size
being 5 letters, and punctuation is excluded. This is to make it harder to guess
things based on word boundaries.

## Examples

- Encoding `test` gives `gvhg`
- Decoding `gvhg` gives `test`
- Decoding `gsvjf rxpyi ldmul cqfnk hlevi gsvoz abwlt` gives `thequickbrownfoxjumpsoverthelazydog`

You need to implement the `decode` and `encode` functions, which decode and encode a `String` using an Atbash cipher.
You can use the provided signature if you are unsure about the types, but don't let it restrict your creativity.

This exercise works with textual data. For historical reasons, Haskell's
`String` type is synonymous with `[Char]`, a list of characters. For more
efficient handling of textual data, the `Text` type can be used.

As an optional extension to this exercise, you can

- read about [string types](https://haskell-lang.org/tutorial/string-types) in
  Haskell.
- add `- text` to your list of dependencies in package.yaml.
- import `Data.Text` in [the following
  way](https://hackernoon.com/4-steps-to-a-better-imports-list-in-haskell-43a3d868273c):

```haskell
import qualified Data.Text as T
import           Data.Text (Text)
```

- use the `Text` type e.g. `decode :: Text -> Text` and refer to
  `Data.Text` combinators as e.g. `T.pack`.
- look up the documentation for
  [`Data.Text`](https://hackage.haskell.org/package/text/docs/Data-Text.html).
- replace all occurrences of `String` with `Text` in Atbash.hs, i.e.:

```haskell
decode :: Text -> Text
decode cipherText = ...

encode :: Text -> Text
encode plainText = ...
```

This part is entirely optional.

## Source

### Created by

- @etrepum

### Contributed to by

- @iHiD
- @JavierGelatti
- @kytrinyx
- @lpalma
- @navossoc
- @petertseng
- @ppartarr
- @rbasso
- @sshine
- @stevejb71
- @tejasbubane

### Based on

Wikipedia - http://en.wikipedia.org/wiki/Atbash
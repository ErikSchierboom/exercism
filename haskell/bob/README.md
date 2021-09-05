# Bob

Welcome to Bob on Exercism's Haskell Track.
If you need help running the tests or submitting your code, check out `HELP.md`.

## Instructions

Bob is a lackadaisical teenager. In conversation, his responses are very limited.

Bob answers 'Sure.' if you ask him a question, such as "How are you?".

He answers 'Whoa, chill out!' if you YELL AT HIM (in all capitals).

He answers 'Calm down, I know what I'm doing!' if you yell a question at him.

He says 'Fine. Be that way!' if you address him without actually saying
anything.

He answers 'Whatever.' to anything else.

Bob's conversational partner is a purist when it comes to written communication and always follows normal rules regarding sentence punctuation in English.

You need to implement the `responseFor` function that returns Bob's response
for a given input. You can use the provided signature if you are unsure
about the types, but don't let it restrict your creativity:

```haskell
responseFor :: String -> String
```

To solve this exercise you may read up on:

- [Guards][guards]

[guards]: https://www.futurelearn.com/courses/functional-programming-haskell/0/steps/27226

This exercise works with textual data. For historical reasons, Haskell's
`String` type is synonymous with `[Char]`, a list of characters. For more
efficient handling of textual data, the `Text` type can be used.

As an optional extension to this exercise, you can

- Read about [string types](https://haskell-lang.org/tutorial/string-types) in Haskell.
- Add `- text` to your list of dependencies in package.yaml.
- Import `Data.Text` in [the following way](https://hackernoon.com/4-steps-to-a-better-imports-list-in-haskell-43a3d868273c):

    ```haskell
    import qualified Data.Text as T
    import           Data.Text (Text)
    ```

- You can now write e.g. `responseFor :: Text -> Text` and refer to `Data.Text` combinators as e.g. `T.isSuffixOf`.
- Look up the documentation for [`Data.Text`](https://hackage.haskell.org/package/text/docs/Data-Text.html),
- You can then replace all occurrences of `String` with `Text` in Bob.hs:

    ```haskell
    responseFor :: Text -> Text
    ```

This part is entirely optional.

## Source

### Created by

- @etrepum

### Contributed to by

- @austinlyons
- @cmccandless
- @danbst
- @eijynagai
- @hritchie
- @iHiD
- @jrib
- @Kobata
- @kytrinyx
- @petertseng
- @ppartarr
- @rbasso
- @sshine
- @tejasbubane
- @tofische

### Based on

Inspired by the 'Deaf Grandma' exercise in Chris Pine's Learn to Program tutorial. - http://pine.fm/LearnToProgram/?Chapter=06
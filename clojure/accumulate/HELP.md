# Help

## Running the tests

Leiningen can be used to run the exercise's test by running the following command from the exercise's directory:

```bash
lein test
```

## REPL

To use the REPL to run the exercise's test, run the following command from the exercise's directory:

```bash
$ lein repl
```

Then `require` the exercise's test namespace and the Clojure test namespace):

```clojure
;; replace <exercise> with the exercise's name
=> (require '<exercise>-test)
```

Then call `run-tests` on `<exercise>-test`:

```clojure
;; replace <exercise> with the exercise's name
=> (clojure.test/run-tests '<exercise>-test)
```

## Submitting your solution

You can submit your solution using the `exercism submit src/accumulate.clj` command.
This command will upload your solution to the Exercism website and print the solution page's URL.

It's possible to submit an incomplete solution which allows you to:

- See how others have completed the exercise
- Request help from a mentor

## Need to get help?

If you'd like help solving the exercise, check the following pages:

- The [Clojure track's documentation](https://exercism.org/docs/tracks/clojure)
- [Exercism's support channel on gitter](https://gitter.im/exercism/support)
- The [Frequently Asked Questions](https://exercism.org/docs/using/faqs)

Should those resources not suffice, you could submit your (incomplete) solution to request mentoring.

To get help if you're having trouble, you can use one of the following resources:

- [ClojureDocs](https://clojuredocs.org) A repository of language references and examples by function or keyword.
- [/r/clojure](https://www.reddit.com/r/clojure) is the C# subreddit.
- [StackOverflow](http://stackoverflow.com/questions/tagged/clojure) can be used to search for your problem and see if it has been answered already. You can also ask and answer questions.
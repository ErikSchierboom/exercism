# Help

## Running the tests

To use the CLI to run the exercise's test, run the following command from the exercise's directory:

```bash
clojure -A:test
```

## REPL

To use the REPL to run the exercise's test, run the following command from the exercise's directory:

```bash
$ clojure -m cljs.main -re node
```

Then `require` the exercise's test namespace and the Clojure test namespace):

```clojure
;; replace <exercise> with the exercise's name
=> (require '<exercise>-test)
nil
;; and the test namespace
=> (require 'cljs.test)
```

Change the ns to the test namespace:

```clojure
;; replace <exercise> with the exercise's name
=> (ns <exercise>-test)
nil
```

Then call `run-tests`:

```clojure
=> (cljs.test/run-tests)
```

## Submitting your solution

You can submit your solution using the `exercism submit src/two_fer.cljs` command.
This command will upload your solution to the Exercism website and print the solution page's URL.

It's possible to submit an incomplete solution which allows you to:

- See how others have completed the exercise
- Request help from a mentor

## Need to get help?

If you'd like help solving the exercise, check the following pages:

- The [ClojureScript track's documentation](https://exercism.org/docs/tracks/clojurescript)
- [Exercism's support channel on gitter](https://gitter.im/exercism/support)
- The [Frequently Asked Questions](https://exercism.org/docs/using/faqs)

Should those resources not suffice, you could submit your (incomplete) solution to request mentoring.

To get help if you're having trouble, you can use one of the following resources:

- [ClojureScript API](http://cljs.github.io/api/) official API doc.
- [Clojurescript Cheat-Sheet](https://clojure.org/api/cheatsheet), an official cheat-sheet.
- [/r/clojurescript](https://www.reddit.com/r/clojurescript) is the C# subreddit.
- [StackOverflow](http://stackoverflow.com/questions/tagged/clojurescript) can be used to search for your problem and see if it has been answered already. You can also ask and answer questions.
# Help

## Running the tests

If you have the 8th binary on your path, enter the command:

```bash
8th -f test.8th
```

If the 8th binary is not on the PATH, in Windows enter

```cmd
\path\to\8th -f test.8th
```

Linux or macOS:

```bash
/path/to/8th -f test.8th
```

## Testing in the REPL

Start 8th, loading test-words.8th: 

```sh
8th -f test-words.8th
```

This will start a CLI session where, once you’ve written some code in your solution file, you can load it into the REPL.
For example, for the "word-count" exercise, you would enter:

```8th
"word-count.8th" f:include
```

And you can run the tests with 
```sh
"word-count-tests.8th" f:include
```

Or you can copy and paste a single test from that file or enter your own. 

## Skipped tests

Solving an exercise means making all its tests pass.
By default, only one test (the first one) is executed when you run the tests.
This is intentional, as it allows you to focus on just making that one test pass.
Once it passes, you can enable the next test by moving the `SKIP-REST-OF-TESTS` word after it.

## Overriding skips

To run all tests, including the ones after the `SKIP-REST-OF-TESTS` word, you can set an environment variable `RUN_ALL_TESTS` to the value `true`. 
One way to set this just for the duration of running the tests is (macOS and Linux):

```bash
RUN_ALL_TESTS=true 8th -f test.8th
```

## Submitting your solution

You can submit your solution using the `exercism submit hamming.8th` command.
This command will upload your solution to the Exercism website and print the solution page's URL.

It's possible to submit an incomplete solution which allows you to:

- See how others have completed the exercise
- Request help from a mentor

## Need to get help?

If you'd like help solving the exercise, check the following pages:

- The [8th track's documentation](https://exercism.org/docs/tracks/8th)
- The [8th track's programming category on the forum](https://forum.exercism.org/c/programming/8th)
- [Exercism's programming category on the forum](https://forum.exercism.org/c/programming/5)
- The [Frequently Asked Questions](https://exercism.org/docs/using/faqs)

Should those resources not suffice, you could submit your (incomplete) solution to request mentoring.

Help from other 8th programmers can be found on the [8th forum](https://8th-dev.com/forum/).

Also on-line is the list of [8th words](https://8th-dev.com/words.html) and the [8th manual](https://8th-dev.com/manual.html).
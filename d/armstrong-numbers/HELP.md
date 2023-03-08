# Help

## Running the tests

You can run the tests by running the following command in the exercise's directory:

```bash
dub test
```

## Passing the Tests

Get the first test compiling, linking and passing by following the [three
rules of test-driven development](http://butunclebob.com/ArticleS.UncleBob.TheThreeRulesOfTdd).
Create just enough structure by declaring namespaces, functions, classes,
etc., to satisfy any compiler errors and get the test to fail. Then write
just enough code to get the test to pass. Once you've done that,
uncomment the next test by moving the following line past the next test.

```D
static if (all_tests_enabled)
```

This may result in compile errors as new constructs may be invoked that
you haven't yet declared or defined. Again, fix the compile errors minimally
to get a failing test, then change the code minimally to pass the test,
refactor your implementation for readability and expressiveness and then
go on to the next test.

Try to use standard D facilities in preference to writing your own
low-level algorithms or facilities by hand.

## Submitting your solution

You can submit your solution using the `exercism submit source/armstrong_numbers.d` command.
This command will upload your solution to the Exercism website and print the solution page's URL.

It's possible to submit an incomplete solution which allows you to:

- See how others have completed the exercise
- Request help from a mentor

## Need to get help?

If you'd like help solving the exercise, check the following pages:

- The [D track's documentation](https://exercism.org/docs/tracks/d)
- [Exercism's programming category on the forum](https://forum.exercism.org/c/programming/5)
- The [Frequently Asked Questions](https://exercism.org/docs/using/faqs)

Should those resources not suffice, you could submit your (incomplete) solution to request mentoring.

To get help if you're having trouble, you can use one of the following resources:

- [DRefLanguage](https://dlang.org/spec/spec.html) contains the D language specification
- [DReference](https://dlang.org/phobos/index.html) contains the D standard library documentation
- [/r/dlang](https://www.reddit.com/r/dlang) is the D subreddit.
- [StackOverflow](http://stackoverflow.com/questions/tagged/d) can be used to search for your problem and see if it has been answered already. You can also ask and answer questions.
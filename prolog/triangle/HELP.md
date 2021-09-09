# Help

## Running the tests

## Non-interactive

To run your implementation directly run:

```bash
swipl -f <exercise>.pl -s <exercise>_tests.plt -g run_tests,halt -t 'halt(1)'
```

In both cases, replace `<exercise>` with the name of the exercise you are implementing.

## Interactive

To run prolog interactively first run:

```bash
swipl
```

After the prolog console starts, load your implementation and run the tests
with:

```
?- ["<exercise>.pl"].
?- ["<exercise>_tests.plt"].
?- run_tests.
```

In both cases, replace `<exercise>` with the name of the exercise you are implementing.

## Skipped tests

When you first begin an exercise, only the first test will run. The rest have
been skipped by adding `condition(pending)` to the `test` goal. Once the first
test passes, un-skip the next test by changing `pending` in `condition(pending)`
to `true`. Repeat for each test until they are all running and passing.

## Submitting your solution

You can submit your solution using the `exercism submit triangle.pl` command.
This command will upload your solution to the Exercism website and print the solution page's URL.

It's possible to submit an incomplete solution which allows you to:

- See how others have completed the exercise
- Request help from a mentor

## Need to get help?

If you'd like help solving the exercise, check the following pages:

- The [Prolog track's documentation](https://exercism.org/docs/tracks/prolog)
- [Exercism's support channel on gitter](https://gitter.im/exercism/support)
- The [Frequently Asked Questions](https://exercism.org/docs/using/faqs)

Should those resources not suffice, you could submit your (incomplete) solution to request mentoring.

To get help if you're having trouble, you can use one of the following resources:

- [SWI Prolog Documentation](http://www.swi-prolog.org)
- [Tutorials and Resources](http://www.swi-prolog.org/Links.html)
- [/r/prolog](https://www.reddit.com/r/prolog) is the Prolog subreddit.
- [StackOverflow](http://stackoverflow.com/questions/tagged/prolog) can be used to search for your problem and see if it has been answered already. You can also ask and answer questions.
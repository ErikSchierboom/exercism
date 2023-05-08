# Help

## Running the tests

## Command line

The following command can be used to run the tests from the command line:

```bash
swipl -f <exercise>.pl -s <exercise>_tests.plt -g run_tests,halt -t 'halt(1)'
```

Replace `<exercise>` with the name of the exercise you are implementing.

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

Replace `<exercise>` with the name of the exercise you are implementing.

### Reloading changes

Once the above files are loaded, you can apply any changes you've made
by running:

```
?- make.
```

## Skipped tests

When you first begin an exercise, only the first test will run. The rest have
been skipped by adding `condition(pending)` to the `test` goal. Once the first
test passes, un-skip the next test by changing `pending` in `condition(pending)`
to `true`. Repeat for each test until they are all running and passing.

### Command line

Add the `-- --all` argument to the end of the command to also run any pending tests:

```bash
swipl -f <exercise>.pl -s <exercise>_tests.plt -g run_tests,halt -t 'halt(1)' -- --all
```

## Submitting your solution

You can submit your solution using the `exercism submit acronym.pl` command.
This command will upload your solution to the Exercism website and print the solution page's URL.

It's possible to submit an incomplete solution which allows you to:

- See how others have completed the exercise
- Request help from a mentor

## Need to get help?

If you'd like help solving the exercise, check the following pages:

- The [Prolog track's documentation](https://exercism.org/docs/tracks/prolog)
- [Exercism's programming category on the forum](https://forum.exercism.org/c/programming/5)
- The [Frequently Asked Questions](https://exercism.org/docs/using/faqs)

Should those resources not suffice, you could submit your (incomplete) solution to request mentoring.

To get help if you're having trouble, you can use one of the following resources:

- [SWI Prolog Documentation](http://www.swi-prolog.org)
- [Tutorials and Resources](http://www.swi-prolog.org/Links.html)
- [/r/prolog](https://www.reddit.com/r/prolog) is the Prolog subreddit.
- [StackOverflow](http://stackoverflow.com/questions/tagged/prolog) can be used to search for your problem and see if it has been answered already. You can also ask and answer questions.
# Help

## Running the tests

To run the test suite:
```bash
tclsh exercise.test
```

## Skipped tests

Solving an exercise means making all its tests pass. By default, only one
test (the first one) is executed when you run the tests. This is
intentional, as it allows you to focus on just making that one test pass.
Once it passes, you can enable the next test by commenting out or removing
the `skip` command preceding it.

Alternately, to run all the tests regardless of their "skipped" status:
```bash
RUN_ALL=1 tclsh exercise.test
```

## Submitting your solution

You can submit your solution using the `exercism submit leap.tcl` command.
This command will upload your solution to the Exercism website and print the solution page's URL.

It's possible to submit an incomplete solution which allows you to:

- See how others have completed the exercise
- Request help from a mentor

## Need to get help?

If you'd like help solving the exercise, check the following pages:

- The [Tcl track's documentation](https://exercism.org/docs/tracks/tcl)
- The [Tcl track's programming category on the forum](https://forum.exercism.org/c/programming/tcl)
- [Exercism's programming category on the forum](https://forum.exercism.org/c/programming/5)
- The [Frequently Asked Questions](https://exercism.org/docs/using/faqs)

Should those resources not suffice, you could submit your (incomplete) solution to request mentoring.

Places to look for help for Tcl questions:

* [Stack Overflow](https://stackoverflow.com/tags/tcl) `tcl` tag.
* check the Resources section of the [Stack Overflow `tcl` tag into page](https://stackoverflow.com/tags/tcl/info).
* raise an issue at the [exercism/tcl](https://github.com/exercism/tcl) repository on GitHub.
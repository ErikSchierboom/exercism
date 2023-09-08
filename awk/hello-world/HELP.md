# Help

## Running the tests

Each exercise contains a test file.
Run the tests using the `bats` program.
```bash
bats test-hello-world.bats
```

`bats` will need to be installed.
See the [Testing on the Bash track][bash] page for instructions to install `bats` for your system.

### bats is implemented in bash

The bats file is a bash script, with some special functions recognized by the `bats` command.
You'll see some tests that look like
```sh
gawk -f some-exercise.awk <<< "some,input,here"
```
That `<<<` syntax is a bash [Here String][here-string].
It sends the string on the right-hand side into the standard input of the program on the left-hand side.
It is ([approximately][so]) the same as
```sh
echo "some,input,here" | gawk -f some-exercise.awk
```

## Help for assert functions

The tests use functions from the [bats-assert][bats-assert] library.
Help for the various `assert*` functions can be found there.

## Skipped tests

Solving an exercise means making all its tests pass.
By default, only one test (the first one) is executed when you run the tests.
This is intentional, as it allows you to focus on just making that one test pass.
Once it passes, you can enable the next test by commenting out or removing the

    [[ $BATS_RUN_SKIPPED == true ]] || skip

annotations prepending other tests.

## Overriding skips

To run all tests, including the ones with `skip` annotations, you can run:
```bash
BATS_RUN_SKIPPED=true bats test-some-exercise.bats
```

It can be convenient to use a wrapper function to save on typing: in `bash` you can do:
```bash
bats() {
    BATS_RUN_SKIPPED=true command bats *.bats
}
```
Then run tests with just:
```bash
bats
```

[bash]: https://exercism.org/docs/tracks/bash/tests
[bats-assert]: https://github.com/bats-core/bats-assert
[here-string]: https://www.gnu.org/software/bash/manual/bash.html#Here-Strings
[so]: https://unix.stackexchange.com/a/80372/4667

## Submitting your solution

You can submit your solution using the `exercism submit hello-world.awk` command.
This command will upload your solution to the Exercism website and print the solution page's URL.

It's possible to submit an incomplete solution which allows you to:

- See how others have completed the exercise
- Request help from a mentor

## Need to get help?

If you'd like help solving the exercise, check the following pages:

- The [AWK track's documentation](https://exercism.org/docs/tracks/awk)
- [Exercism's programming category on the forum](https://forum.exercism.org/c/programming/5)
- The [Frequently Asked Questions](https://exercism.org/docs/using/faqs)

Should those resources not suffice, you could submit your (incomplete) solution to request mentoring.

Places to look for help for AWK questions:

* [Stack Overflow `awk` tag][so].
* check the Resources section of the [Stack Overflow `awk` tag into page][so-info].
* raise an issue at the [exercism/awk][github] Github repository.
* IRC: `irc://irc.liberachat.net/#awk`, `irc://irc.liberachat.net/#exercism`
    * see [Libera.chat][libera] if you're unfamiliar with IRC.


[so]: https://stackoverflow.com/tags/awk
[so-info]: https://stackoverflow.com/tags/awk/info
[github]: https://github.com/exercism/awk
[libera]: https://libera.chat
# Hello World

Welcome to Hello World on Exercism's Clojure Track.
If you need help running the tests or submitting your code, check out `HELP.md`.

## Instructions

The classical introductory exercise.
Just say "Hello, World!".

["Hello, World!"][hello-world] is the traditional first program for beginning programming in a new language or environment.

The objectives are simple:

- Modify the provided code so that it produces the string "Hello, World!".
- Run the test suite and make sure that it succeeds.
- Submit your solution and check it at the website.

If everything goes well, you will be ready to fetch your first real exercise.

[hello-world]: https://en.wikipedia.org/wiki/%22Hello,_world!%22_program

## Project Structure

Clojure exercises in Exercism support the two most common tools for dependency management and testing, [leiningen][leiningen] and the [Clojure CLI][clojure-cli].

You will find a test file named `hello_world_test.clj` inside the `test` directory.
Write your code in `src/hello_world.clj`. It should use the namespace `hello-world` so that tests can pick it up.

### Running tests using the Clojure CLI

```
$ clj -X:test
```

### Running tests using Leiningen

```
$ lein test

lein test hello-world-test

Ran 3 tests containing 3 assertions.
0 failures, 0 errors.
```

Then submit the exercise using:

```
$ exercism submit src/hello_world.clj
```

For more detailed instructions and learning resources refer to [Exercism's Clojure language page][exercism-clojure].

[leiningen]: https://leiningen.org
[clojure-cli]: https://clojure.org/guides/deps_and_cli
[exercism-clojure]: https://exercism.org/tracks/clojure

## Source

### Contributed to by

- @AndreaCrotti
- @christianpoveda
- @haus
- @jcorrado
- @sjwarner-bp
- @tejasbubane
- @yurrriq

### Based on

This is an exercise to introduce users to using Exercism - https://en.wikipedia.org/wiki/%22Hello,_world!%22_program
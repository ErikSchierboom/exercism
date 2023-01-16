# Hello World

Welcome to Hello World on Exercism's Crystal Track.
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

* `src` contains your solution to the exercise
* `spec` contains the tests to run for the exercise

## Running Tests

If you're in the right directory (i.e. the one containing `src` and `spec`), you can run the tests for that exercise by running `crystal spec`:

```bash
$ pwd
/Users/johndoe/Code/exercism/crystal/hello-world

$ ls
GETTING_STARTED.md README.md          spec               src

$ crystal spec
```

This will run all of the test files in the `spec` directory.

In each test file, all but the first test have been skipped.

Once you get a test passing, you can unskip the next one by changing `pending` to `it`.

## Submitting Your Solution

Be sure to submit the source file in the `src` directory when submitting your solution:

```bash
$ exercism submit src/hello_world.cr
```

## Source

### Created by

- @mhelmetag

### Contributed to by

- @amscotti
- @bmulvihill
- @issyl0
- @jhonnymoreira
- @kytrinyx

### Based on

This is an exercise to introduce users to using Exercism - https://en.wikipedia.org/wiki/%22Hello,_world!%22_program
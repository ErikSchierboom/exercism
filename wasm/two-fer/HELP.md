# Help

## Running the tests

## Setup

Go through the setup [instructions for WebAssembly][docs-exercism-wasm] to install the necessary dependencies.

## Requirements

Install assignment dependencies:

```shell
# Using npm
npm install

# Alternatively using yarn
yarn
```

## Making the test suite pass

All exercises come with a test suite to help you validate your solution before submitting.
You can execute these tests by opening a command prompt in the exercise's directory, and then running:

```bash
# Using npm
npm test

# Alternatively using yarn
yarn test
```

In some test suites all tests but the first have been skipped.

Once you get a test passing, you can enable the next one by changing `xtest` to `test`.

## Writing custom tests

If you wish to write additional, custom, tests, create a new file `custom.spec.js`, and submit it with your solution together with the new file:

```shell
exercism submit numbers.wat custom.spec.js
```

[docs-exercism-wasm]: https://exercism.org/docs/tracks/wasm/installation

## Submitting your solution

You can submit your solution using the `exercism submit two-fer.wat` command.
This command will upload your solution to the Exercism website and print the solution page's URL.

It's possible to submit an incomplete solution which allows you to:

- See how others have completed the exercise
- Request help from a mentor

## Need to get help?

If you'd like help solving the exercise, check the following pages:

- The [WebAssembly track's documentation](https://exercism.org/docs/tracks/wasm)
- The [WebAssembly track's programming category on the forum](https://forum.exercism.org/c/programming/wasm)
- [Exercism's programming category on the forum](https://forum.exercism.org/c/programming/5)
- The [Frequently Asked Questions](https://exercism.org/docs/using/faqs)

Should those resources not suffice, you could submit your (incomplete) solution to request mentoring.

To get help if you're having trouble, you can use one of the following resources:

- [/r/WebAssembly](https://www.reddit.com/r/WebAssembly/) is the WebAssembly subreddit.
- [Github issue tracker](https://github.com/exercism/wasm/issues) is where we track our development and maintenance of Javascript exercises in exercism. But if none of the above links help you, feel free to post an issue here.
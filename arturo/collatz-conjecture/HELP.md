# Help

## Running the tests

This track uses the [Unitt unit-testing package][unitt], installed automatically when running the tests.
From within the exercise folder, run `exercism test` or `arturo tester.art` to run your solution against the test suite.

If you haven't written any code, the test suite will fail with a message like:

```plaintext
===== tests\test-leap.art =====

Suite: Leap 


══╡ Program Error ╞═════════════════════════════════════════════════ <script> ══

  please implement the isLeap? function



===== Statistics =====

⏏️    TOTAL: 0 assertions
✅  PASSED: 0 assertions
⏩ SKIPPED: 0 assertions
❌  FAILED: 0 assertions

===== ========== =====
```

Replace the `panic "please implement the <some-function-name> function"` line in `src\<your-exercise>.art` with your solution.
Then rerun the test suite, and you should see something like:

```plaintext
===== tests\test-leap.art =====

Suite: Leap

    ✅ - assert that a year not divisible by 4 is a common year
         assertion: false = false

    ⏩ - assert that a year divisible by 2 and not divisible by 4 is a common year 
         skipped!

    ⏩ - assert that a year divisible by 4 and not divisible by 100 is a leap year
         skipped!

===== Statistics =====

⏏️    TOTAL: 1 assertions
✅  PASSED: 1 assertions
⏩ SKIPPED: 2 assertions
❌  FAILED: 0 assertions

===== ========== =====
```

The output lists the test file path, the name of the test suite, and the test case assertions, reporting whether a test had passed (✅), failed (❌) or was skipped (⏩). 

The following test file has three tests, one of which is skipped.
Unskip a test by replacing `test.skip` with `test` beside the description for the test.

```arturo
import {unitt}!
import {src/leap}!

suite "Leap" [
    test "a year not divisible by 4 is a common year" [
        result: isLeap? 2015
        assert -> false = result
    ]

    test "a year divisible by 2 and not divisible by 4 is a common year" [
        result: isLeap? 1970
        assert -> false = result
    ]

    test.skip "a year divisible by 4 and not divisible by 100 is a leap year" [
        result: isLeap? 1996
        assert -> true = result
    ]
]
```

If we rerun the tests again, the second test is run and passes, but the third test is still skipped.


```plaintext
===== tests\test-leap.art =====

Suite: Leap

    ✅ - assert that a year not divisible by 4 is a common year
         assertion: false = false

    ✅ - assert that a year divisible by 2 and not divisible by 4 is a common year 
         assertion: false = false

    ⏩ - assert that a year divisible by 4 and not divisible by 100 is a leap year
         skipped!

===== Statistics =====

⏏️    TOTAL: 2 assertions
✅  PASSED: 2 assertions
⏩ SKIPPED: 1 assertions
❌  FAILED: 0 assertions

===== ========== =====
```

A failed test would look like this

```plaintext
===== tests/test-leap.art =====

Suite: Leap 
 
    ✅ - assert that a year not divisible by 4 is a common year 
         assertion: false = false

    ✅ - assert that a year divisible by 2 and not divisible by 4 is a common year 
         assertion: false = false

    ❌ - assert that a year divisible by 4 and not divisible by 100 is a leap year 
         assertion: true = false




===== Statistics =====

⏏️    TOTAL: 3 assertions
✅  PASSED: 2 assertions
⏩ SKIPPED: 0 assertions
❌  FAILED: 1 assertions

===== ========== =====
```

Once all tests pass, you can submit your solution using `exercism submit`.

[packager]: https://pkgr.art/

## Submitting your solution

You can submit your solution using the `exercism submit src/collatz-conjecture.art` command.
This command will upload your solution to the Exercism website and print the solution page's URL.

It's possible to submit an incomplete solution which allows you to:

- See how others have completed the exercise
- Request help from a mentor

## Need to get help?

If you'd like help solving the exercise, check the following pages:

- The [Arturo track's documentation](https://exercism.org/docs/tracks/arturo)
- The [Arturo track's programming category on the forum](https://forum.exercism.org/c/programming/arturo)
- [Exercism's programming category on the forum](https://forum.exercism.org/c/programming/5)
- The [Frequently Asked Questions](https://exercism.org/docs/using/faqs)

Should those resources not suffice, you could submit your (incomplete) solution to request mentoring.

Here are some resources for getting help if you run into trouble

* [Official Documentation][official-docs] covers syntax, language features, and the standard library modules.
* [Arturo Discord][discord] is Arturo's official Discord server.
* [Rosetta Code][rosetta-code] has over 770+ Arturo code examples for many different tasks.

[official-docs]: https://arturo-lang.io/master/documentation/
[discord]: https://discord.gg/YdVK2CB
[rosetta-code]: https://rosettacode.org/wiki/Category:Arturo
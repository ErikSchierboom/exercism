# Help

## Running the tests

Navigate to the directory containing the appropriate `${slug}-test.sql` file, where `${slug}` is the name of the exercise, using hyphens instead of spaces and all lowercase (e.g. `hello-world-test.sql` for the `Hello World` exercise).

```bash
sqlite3 -bail < ${slug}-test.sql
```

You can use `SELECT` statements for debugging.
The output will be forwarded to `user_output.md` and shown in the web-editor if tests fail.

You can find more information in the [sqlite track docs about testing](https://exercism.org/docs/tracks/sqlite/tests).

## Submitting your solution

You can submit your solution using the `exercism submit hello-world.sql` command.
This command will upload your solution to the Exercism website and print the solution page's URL.

It's possible to submit an incomplete solution which allows you to:

- See how others have completed the exercise
- Request help from a mentor

## Need to get help?

If you'd like help solving the exercise, check the following pages:

- The [SQLite track's documentation](https://exercism.org/docs/tracks/sqlite)
- The [SQLite track's programming category on the forum](https://forum.exercism.org/c/programming/sqlite)
- [Exercism's programming category on the forum](https://forum.exercism.org/c/programming/5)
- The [Frequently Asked Questions](https://exercism.org/docs/using/faqs)

Should those resources not suffice, you could submit your (incomplete) solution to request mentoring.

If you're stuck on something, it may help to look at some of the [available resources](https://exercism.org/docs/tracks/sqlite/resources) or ask [The Exercism Community on Discord](https://exercism.org/r/discord).

Additionally, [StackOverflow](http://stackoverflow.com/questions/tagged/sqlite) is a good spot to search for your problem/question to see if it has been answered already.
If not, you can always [ask](https://stackoverflow.com/help/how-to-ask) or [answer](https://stackoverflow.com/help/how-to-answer) someone else's question.
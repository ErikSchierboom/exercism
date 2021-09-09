# Bank Account

Welcome to Bank Account on Exercism's Haskell Track.
If you need help running the tests or submitting your code, check out `HELP.md`.

## Instructions

Simulate a bank account supporting opening/closing, withdrawals, and deposits
of money. Watch out for concurrent transactions!

A bank account can be accessed in multiple ways. Clients can make
deposits and withdrawals using the internet, mobile phones, etc. Shops
can charge against the account.

Create an account that can be accessed from multiple threads/processes
(terminology depends on your programming language).

It should be possible to close an account; operations against a closed
account must fail.

## Instructions

Run the test file, and fix each of the errors in turn. When you get the
first test to pass, go to the first pending or skipped test, and make
that pass as well. When all of the tests are passing, feel free to
submit.

Remember that passing code is just the first step. The goal is to work
towards a solution that is as readable and expressive as you can make
it.

Have fun!

To complete this exercise you need to implement the following functions:

- `openAccount` - Called at the start of each test. Returns a BankAccount.
- `closeAccount` - Called at the end of each test.
- `getBalance` - Get the balance of the bank account.
- `updateBalance` - Increment the balance of the bank account by the given amount.

The amount may be negative for a withdrawal.

The initial balance of the bank account should be 0.

You will find a dummy data declaration and type signatures already in place,
but it is up to you to define the functions and create a meaningful data type,
newtype or type synonym.

If you need help, here are some additional resources:

- Read about [concurrency](https://en.wikipedia.org/wiki/Concurrent_Haskell) in Haskell.
- Look into the [Software Transactional Memory](https://hackage.haskell.org/package/stm) package and its Transactional Variables.

## Source

### Created by

- @etrepum

### Contributed to by

- @iHiD
- @kytrinyx
- @lpalma
- @nicuveo
- @petertseng
- @ppartarr
- @rbasso
- @sshine
- @tejasbubane
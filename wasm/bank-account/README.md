# Bank Account

Welcome to Bank Account on Exercism's WebAssembly Track.
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

## Notes

The intent of this exercise is to investigate some of the parallels between an instance of a WebAssembly module and an instance of a class in OOP languages.

In your solution, a WebAssembly instance should be considered an instance of a bank account, and mutable WebAssembly globals should be used to model private states as in a class.

No linear memory should be required!

## Source

### Created by

- @bushidocodes
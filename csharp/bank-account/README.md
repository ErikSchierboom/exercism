# Bank Account

Welcome to Bank Account on Exercism's C# Track.
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

This exercise requires you to handle data related to currency and money. A normal approuch is to use the [Decimal](https://docs.microsoft.com/en-us/dotnet/api/system.decimal?view=net-6.0) struct to store currency values.
Note though that you then only store the numeric value of a currency.

## Source

### Created by

- @robkeim

### Contributed to by

- @AndrewYHuang
- @artiom
- @ErikSchierboom
- @j2jensen
- @wolf99
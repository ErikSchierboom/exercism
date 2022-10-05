# Newsletter

Welcome to Newsletter on Exercism's Elixir Track.
If you need help running the tests or submitting your code, check out `HELP.md`.
If you get stuck on the exercise, check out `HINTS.md`, but try and solve it without using those first :)

## Introduction

## File

Functions for working with files are provided by the `File` module.

To read a whole file, use `File.read/1`. To write to a file, use `File.write/2`.

Every time a file is written to with `File.write/2`, a file descriptor is opened and a new Elixir [process][exercism-processes] is spawned. For this reason, writing to a file in a loop using `File.write/2` should be avoided.

Instead, a file can be opened using `File.open/2`. The second argument to `File.open/2` is a list of modes, which allows you to specify if you want to open the file for reading or for writing.

`File.open/2` returns a PID of a process that handles the file. To read and write to the file, use functions from the `IO` module and pass this PID as the IO device.

When you're finished working with the file, close it with `File.close/1`.

All the mentioned functions from the `File` module also have a `!` variant that raises an error instead of returning an error tuple (e.g. `File.read!/1`). Use that variant if you don't intend to handle errors such as missing files or lack of permissions.

[exercism-processes]: https://exercism.org/tracks/elixir/concepts/processes

## Instructions

You're a big model train enthusiast and have decided to share your passion with the world by starting a newsletter. You'll start by sending the first issue of your newsletter to your friends and acquaintances that share your hobby. You have a text file with a list of their email addresses.

## 1. Read email addresses from a file

Implement the `Newsletter.read_emails/1` function. It should take a file path. The file is a text file that contains email addresses separated by newlines. The function should return a list of the email addresses from the file.

```elixir
Newsletter.read_emails("/home/my_user/documents/model_train_friends_emails.txt")
# => ["rick@example.com", "choochoo42@example.com", "anna@example.com"]
```

## 2. Open a log file for writing

Sending an email is a task that might fail for many unpredictable reasons, like a typo in the email address or temporary network issues. To ensure that you can retry sending the emails to all your friends without sending duplicates, you need to log the email addresses that already received the email. For this, you'll need a log file.

Implement the `Newsletter.open_log/1` function. It should take a file path, open the file for writing, and return the PID of the process that handles the file.

```elixir
Newsletter.open_log("/home/my_user/documents/newsletter_issue1_log.txt")
# => #PID<0.145.0>
```

## 3. Log a sent email

Implement the `Newsletter.log_sent_email/2` function. It should take a PID of the process that handles the file and a string with the email address. It should write the email address to the file, followed by a newline.

```elixir
Newsletter.log_sent_email(pid, "joe@example.com")
# => :ok
```

## 4. Close the log file

Implement the `Newsletter.close_log/1` function. It should take a PID of the process that handles the file and close the file.

```elixir
Newsletter.close_log(pid)
# => :ok
```

## 5. Send the newsletter

Now that you have all of the building blocks of the email sending procedure, you need to combine them together in a single function.

Implement the `Newsletter.send_newsletter/3` function. It should take a path of the file with email addresses, a path of a log file, and an anonymous function that sends an email to a given email address. It should read all the email addresses from the given file and attempt to send an email to every one of them. If the anonymous function that sends the email returns `:ok`, write the email address to the log file, followed by a new line. Make sure to do it as soon as the email is sent. Afterwards, close the log file.

```elixir
Newsletter.send_newsletter(
  "model_train_friends_emails.txt",
  "newsletter_issue1_log.txt",
  fn email -> :ok end
)
# => :ok
```

## Source

### Created by

- @angelikatyborska

### Contributed to by

- @neenjaw
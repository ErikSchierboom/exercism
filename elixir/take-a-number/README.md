# Take-A-Number

Welcome to Take-A-Number on Exercism's Elixir Track.
If you need help running the tests or submitting your code, check out `HELP.md`.
If you get stuck on the exercise, check out `HINTS.md`, but try and solve it without using those first :)

## Introduction

## Processes

In Elixir, all code runs inside processes.

By default, a function will execute in the same process from which it was called. When you need to explicitly run a certain function in a new process, use `spawn/1`:

```elixir
spawn(fn -> 2 + 2 end)
# => #PID<0.125.0>
```

`spawn/1` creates a new process that executes the given function and returns a _process identifier_ (PID). The new process will stay alive as long as the function executes, and then silently exit.

Elixir's processes should not be confused with operating system processes. Elixir's processes use much less memory and CPU. It's perfectly fine to have Elixir applications that run hundreds of Elixir processes.

### Messages

Processes do not directly share information with one another. Processes _send and receive messages_ to share data.

You can send a message to any process with `send/2`. The first argument to `send/2` is the PID of the recipient, the second argument is the message.

A message can be of any type. Often it consists of atoms and tuples. If you want to get a response, you should include the PID of the sender somewhere in the message. You can get the PID of the current process with `self()`.

`send/2` does not check if the message was received by the recipient, nor if the recipient is still alive. The message ends up in the recipient's _mailbox_ and it will only be read if and when the recipient explicitly asks to _receive messages_.

A message can be read from a mailbox using the `receive/1` macro. It accepts a `do` block that can [pattern match][exercism-pattern-matching] on the messages.

```elixir
receive do
  {:ping, sender_pid} -> send(sender_pid, :pong)
  :do_nothing -> nil
end
```

`receive/1` will take _one message_ from the mailbox that matches any of the given patterns and execute the expression given for that pattern. If there are no messages in the mailbox, or none of messages in the mailbox match any of the patterns, `receive/1` is going to wait for one.

### Receive loop

If you want to receive more than one message, you need to call `receive/1` recursively. It is a common pattern to implement a recursive function, for example named `loop`, that calls `receive/1`, does something with the message, and then calls itself to wait for more messages. If you need to carry some state from one `receive/1` call to another, you can do it by passing an argument to that `loop` function.

## PIDs

Process identifiers are their own data type. They function as _mailbox addresses_ - if you have a process's PID, you can send a message to that process. PIDs are usually created indirectly, as a return value of functions that create new processes, like `spawn`.

[exercism-pattern-matching]: https://exercism.org/tracks/elixir/concepts/pattern-matching

## Instructions

You are writing an embedded system for a Take-A-Number machine. It is a very simple model. It can give out consecutive numbers and report what was the last number given out.

## 1. Start the machine

Implement the `start/0` function. It should spawn a new process that has an initial state of `0` and is ready to receive messages. It should return the process's PID.

```elixir
TakeANumber.start()
# => #PID<0.138.0>
```

Note that each time you run this code, the PID may be different.

## 2. Report the machine state

Modify the machine so that it can receive `{:report_state, sender_pid}` messages. It should send its current state (the last given out ticket number) to `sender_pid` and then wait for more messages.

```elixir
machine_pid = TakeANumber.start()
send(machine_pid, {:report_state, self()})

receive do
  msg -> msg
end
# => 0
```

## 3. Give out numbers

Modify the machine so that it can receive `{:take_a_number, sender_pid}` messages. It should increase its state by 1, send the new state to `sender_pid`, and then wait for more messages.

```elixir
machine_pid = TakeANumber.start()
send(machine_pid, {:take_a_number, self()})

receive do
  msg -> msg
end
# => 1
```

## 4. Stop the machine

Modify the machine so that it can receive a `:stop` message. It should stop waiting for more messages.

## 5. Ignore unexpected messages

Modify the machine so that when it receives an unexpected message, it ignores it and continues waiting for more messages.

## Source

### Created by

- @angelikatyborska

### Contributed to by

- @neenjaw

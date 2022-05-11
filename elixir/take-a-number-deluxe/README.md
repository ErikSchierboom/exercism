# Take-A-Number Deluxe

Welcome to Take-A-Number Deluxe on Exercism's Elixir Track.
If you need help running the tests or submitting your code, check out `HELP.md`.
If you get stuck on the exercise, check out `HINTS.md`, but try and solve it without using those first :)

## Introduction

## GenServer

`GenServer` (generic server) is a [behaviour][concept-behaviours] that abstracts common client-server interactions between Elixir processes.

Remember the receive loop from when we learned about [processes][concept-processes]? The `GenServer` behaviour provides abstractions for implementing such loops, and for exchanging messages with a process that runs such a loop. It makes it easier to keep state and execute asynchronous code.

Be warned that the name `GenServer` is loaded. It is also used to describe a _module_ that _uses_ the `GenServer` behaviour, as well as a _process_ that was started from a module that _uses_ the `GenServer` behaviour.

The `GenServer` behaviour defines one required callback, `init/1`, and a few interesting optional callbacks: `handle_call/3`, `handle_cast/2`, and `handle_info/3`. The _clients_ using a `GenServer` aren't supposed to call those callbacks directly. Instead, the `GenServer` module provides functions that clients can use to communicate with a `GenServer` process.

Often, a single module defines both a _client API_, a set of functions that other parts of your Elixir app can call to communicate with this `GenServer` process, and _server callback implementations_, which contain this `GenServer`'s logic.

Let's take a look at a simple example of a `GenServer` first, and then learn what each callback means.

### Example

This is an example server that can respond to the repetitive inquisitions of annoying passengers during a long road trip, more exactly the question: "are we there yet?". It keeps track of how many times this question has been asked, returning increasingly more annoyed responses.

```elixir
defmodule AnnoyingPassengerAutoresponder do
  use GenServer
  # Client API

  def start_link(init_arg) do
    GenServer.start_link(__MODULE__, init_arg)
  end

  def are_we_there_yet?(pid) do
    GenServer.call(pid, :are_we_there_yet?)
  end

  # Server callbacks

  @impl GenServer
  def init(_init_arg) do
    # the initial count of questions asked is always 0
    state = 0
    {:ok, state}
  end

  @impl GenServer
  def handle_call(:are_we_there_yet?, _from, state) do
    reply =
      cond do
        state <= 3 -> "No."
        state <= 10 -> "I told you #{state} times already. No."
        true -> "..."
      end

    # increase the count of questions asked
    new_state = state + 1
    # reply to the caller
    {:reply, reply, new_state}
  end
end
```

### Callbacks

#### `init/1`

A server can be started by calling `GenServer.start/3` or `GenServer.start_link/3`. We learned about the difference between those functions in the [links concept][concept-links].

Those two functions:
- Accept a module implementing the `GenServer` behaviour as the first argument.
- Accept anything as the second argument called `init_arg`. As the name suggest, this argument gets passed to the `init/1` callback.
- Accept an optional third argument with advanced options for running the process that we wont' cover now.

Starting a server by calling `GenServer.start/3` or `GenServer.start_link/3` will invoke the `init/1` callback in a blocking way. The return value of `init/1` dictates if the server can be started successfully.

The `init/1` callback usually returns one of those values:
- `{:ok, state}`. The server will start its receive loop using `state` as its initial state. `state` can be of any type.
- `{:stop, reason}`. `reason` can be of any type. The server will not start its receive loop. The process will exit with the given reason.

There are also more advanced possibilities that we won't cover now.

If the server's receive loop starts, the functions `GenServer.start/3` and `GenServer.start_link/3` return an `{:ok, pid}` tuple. Otherwise they return `{:error, reason}`

#### `handle_call/3`

A message that requires a reply can be sent to a server process with `GenServer.call/2`. This function expects the `pid` of a running server process as the first argument, and the message as the second argument. The message can be of any type.

The `handle_call/3` callback is responsible for handling and responding to synchronous messages. It receives three arguments:

1. `message` - the value passed as the second argument to `GenServer.call/2`.
2. `from` - the `pid` of the process calling `GenServer.call/2`. Most often this argument can be ignored.
3. `state` - the current state of the server. Remember that its initial value was set in the `init/1` callback.

The `handle_call/3` callback usually returns a 3 tuple of `{:reply, reply, state}`. This means that the second element in the tuple, a `reply` that can be of any type, will be sent back to the caller. The third element in the tuple, `state`, is the new state of the server after handling this message.

There are also more advanced possibilities that we won't cover now.

~~~~exercism/note
To memorize what this callback does by its name,
think of it as "calling" somebody on the phone.

If that person is available, you'll receive a reply immediately (synchronously).
~~~~

#### `handle_cast/2`

A message that doesn't require a reply can be sent to a server process with `GenServer.cast/2`. Its arguments are identical to those of `GenServer.call/2`.

The `handle_cast/2` callback is responsible for handling those messages. It receives two arguments, `message` and `state`, which are the same arguments as in the  `handle_call/3` callback (except for `from`).

The `handle_cast/2` callback usually returns a 2 tuple of `{:noreply, state}`.

There are also more advanced possibilities that we won't cover now.

~~~~exercism/note
To memorize what this callback does by its name,
remember that "to cast" also means "to throw".

If you throw a message in a bottle into the sea,
you don't expect to receive a reply immediately,
or maybe ever.
~~~~

#### Should I use `call` or `cast`?

Almost always use `call` even if your client code doesn't need the reply from the server.

Using `call` waits for the reply, which serves as a backpressure mechanism (to prevent clients from sending too many messages at once). Receiving a reply from the server is also the only way to be sure that the server received and handled the client's message.

#### `handle_info/2`

Messages can also end up in the server's inbox by means other than calling `GenServer.call/2` or `GenServer.cast/2`, for example calling the plain `send/2` function.

To handle such messages, use the `handle_info/2` callback. This callback works in exactly the same way as `handle_cast/2`.

The `GenServer` behaviour provides a catch-all implementation of `handle_info/2` that logs errors about unexpected messages. If you override that default implementation, make sure to always include your own catch-all implementation. If you forget, the server will crash if it receives an unexpected message.

### Timeouts

The return value of each of the four callbacks described above can be extended by one more tuple element, a timeout. E.g. instead of returning `{:ok, state}` from `init/1`, return `{:ok, state, timeout}`.

The timeout can be used to detect a lack of messages in the mailbox for a specific period. If the server returns a timeout from one of its callbacks, and the specified number of milliseconds have elapsed with no message arriving, `handle_info/2` is called with `:timeout` as the first argument.

[concept-behaviours]: https://exercism.org/tracks/elixir/concepts/behaviours
[concept-processes]: https://exercism.org/tracks/elixir/concepts/processes
[concept-links]: https://exercism.org/tracks/elixir/concepts/links

## Instructions

The basic Take-A-Number machine was selling really well, but some users were complaining about its lack of advanced features compared to other models available on the market.

The manufacturer listened to user feedback and decided to release a deluxe model with more features, and you once again were tasked with writing the software for this machine.

The new features added to the deluxe model include:
- Keeping track of currently queued numbers.
- Setting the minimum and maximum number. This will allow using multiple deluxe Take-A-Number machines for queueing customers to different departments at the same facility, and to tell apart the departments by the number range.
- Allowing certain numbers to skip the queue to provide priority service to pregnant women and the elderly.
- Auto shutdown to prevent accidentally leaving the machine on for the whole weekend and wasting energy.

The business logic of the machine was already implemented by your colleague and can be found in the module `TakeANumberDeluxe.State`. Now your task is to wrap it in a `GenServer`.

## 1. Start the machine

Use the `GenServer` behaviour in the `TakeANumberDeluxe` module.

Implement the `start_link/1` function and the necessary `GenServer` callback.

The argument passed to `start_link/1` is a keyword list. It contains the keys `:min_number` and `:max_number`. The values under those keys need to be passed to the function `TakeANumberDeluxe.State.new/2`.

If `TakeANumberDeluxe.State.new/2` returns an `{:ok, state}` tuple, the machine should start, using the returned state as its state. If it returns an `{:error, error}` tuple instead, the machine should stop, giving the returned error as the reason for stopping.

```elixir
TakeANumberDeluxe.start_link(min_number: 1, max_number: 9)
# => {:ok, #PID<0.174.0>}

TakeANumberDeluxe.start_link(min_number: 9, max_number: 1)
# => {:error, :invalid_configuration}
```

You might have noticed that the function `TakeANumberDeluxe.State.new/2` also takes an optional third argument, `auto_shutdown_timeout`. We will use it in the last step of this exercise.

## 2. Report machine state

Implement the `report_state/1` function and the necessary `GenServer` callback. The machine should reply to the caller with its current state.

```elixir
{:ok, machine} = TakeANumberDeluxe.start_link(min_number: 1, max_number: 10)
TakeANumberDeluxe.report_state(machine)
# => %TakeANumberDeluxe.State{
#      max_number: 10,
#      min_number: 1,
#      queue: %TakeANumberDeluxe.Queue{in: [], out: []},
#      auto_shutdown_timeout: :infinity,
#    }
```

## 3. Queue new numbers

Implement the `queue_new_number/1` function and the necessary `GenServer` callback.

It should call the `TakeANumberDeluxe.State.queue_new_number/1` function with the current state of the machine.

If `TakeANumberDeluxe.State.queue_new_number/1` returns an `{:ok, new_number, new_state}` tuple, the machine should reply to the caller with the new number and set the new state as its state. If it returns a `{:error, error}` tuple instead, the machine should reply to the caller with the error and not change its state.

```elixir
{:ok, machine} = TakeANumberDeluxe.start_link(min_number: 1, max_number: 2)
TakeANumberDeluxe.queue_new_number(machine)
# => {:ok, 1}

TakeANumberDeluxe.queue_new_number(machine)
# => {:ok, 2}

TakeANumberDeluxe.queue_new_number(machine)
# => {:error, :all_possible_numbers_are_in_use}
```

## 4. Serve next queued number

Implement the `serve_next_queued_number/2` function and the necessary `GenServer` callback.

It should call the `TakeANumberDeluxe.State.serve_next_queued_number/2` function with the current state of the machine and its second optional argument, `priority_number`.

If `TakeANumberDeluxe.State.serve_next_queued_number/2` returns an `{:ok, next_number, new_state}` tuple, the machine should reply to the caller with the next number and set the new state as its state. If it returns a `{:error, error}` tuple instead, the machine should reply to the caller with the error and not change its state.

```elixir
{:ok, machine} = TakeANumberDeluxe.start_link(min_number: 1, max_number: 10)
TakeANumberDeluxe.queue_new_number(machine)
# => {:ok, 1}

TakeANumberDeluxe.serve_next_queued_number(machine)
# => {:ok, 1}

TakeANumberDeluxe.serve_next_queued_number(machine)
# => {:error, :empty_queue}
```

## 5. Reset state

Implement the `reset_state/1` function and the necessary `GenServer` callback.

It should call the `TakeANumberDeluxe.State.new/2` function to create a new state using the current state's `min_number` and `max_number`. The machine should set the new state as its state. It should not reply to the caller.

```elixir
{:ok, machine} = TakeANumberDeluxe.start_link(min_number: 1, max_number: 10)

TakeANumberDeluxe.reset_state(machine)
# => :ok
```

## 6. Implement auto shutdown

Modify starting the machine. It should read the value under the key `:auto_shutdown_timeout` in the keyword list passed as `init_arg` and pass it as the third argument to `TakeANumberDeluxe.State.new/3`. Use the default value of `:infinity` if `:auto_shutdown_timeout` was not given.

Modify resetting the machine state to also pass `auto_shutdown_timeout` to `TakeANumberDeluxe.State.new/3`.

Modify the return values of all implemented callbacks (`init/1` and all `handle_*` callbacks) to set a timeout. Use the the value under the key `:auto_shutdown_timeout` in the current machine state. Do not add the timeout to the `{:stop, reason}` return value of `init/1` - timeouts only apply after the server has started its receive loop.

Implement a `GenServer` callback to handle the `:timeout` message that will be sent to the machine if it doesn't receive any other messages within the given timeout. It should exit the process with reason `:normal`.

Make sure to also handle any unexpected messages by ignoring them.

```elixir
{:ok, machine} = TakeANumberDeluxe.start_link(
  min_number: 1,
  max_number: 10,
  auto_shutdown_timeout: :timer.hours(2)
)

# after 3 hours...

TakeANumberDeluxe.queue_new_number(machine)
# => ** (exit) exited in: GenServer.call(#PID<0.171.0>, :queue_new_number, 5000)
#        ** (EXIT) no process: the process is not alive or there's no process currently associated with the given name, possibly because its application isn't started
#       (elixir 1.13.0) lib/gen_server.ex:1030: GenServer.call/3
```

## Source

### Created by

- @angelikatyborska

### Contributed to by

- @jiegillet
# Dancing Dots

Welcome to Dancing Dots on Exercism's Elixir Track.
If you need help running the tests or submitting your code, check out `HELP.md`.
If you get stuck on the exercise, check out `HINTS.md`, but try and solve it without using those first :)

## Introduction

## `use`

The `use` macro allows us to quickly extend our module with functionally provided by another module. When we `use` a module, that module can inject code into our module - it can for example define functions, `import` or `alias` other modules, or set module attributes.

If you ever looked at the test files of some of the Elixir exercises here on Exercism, you most likely noticed that they all start with `use ExUnit.Case`. This single line of code is what makes the macros `test` and `assert` available in the test module.

```elixir
defmodule LasagnaTest do
  use ExUnit.Case

  test "expected minutes in oven" do
    assert Lasagna.expected_minutes_in_oven() === 40
  end
end
```

### `__using__/1` macro

What exactly happens when you `use` a module is dictated by that module's `__using__/1` macro. It takes one argument, a keyword list with options, and it returns a [quoted expression][concept-ast]. The code in this quoted expression is inserted into our module when calling `use`.

```elixir
defmodule ExUnit.Case do
  defmacro __using__(opts) do
    # some real-life ExUnit code omitted here
    quote do
      import ExUnit.Assertions
      import ExUnit.Case, only: [describe: 2, test: 1, test: 2, test: 3]
    end
  end
end
```

The options can be given as a second argument when calling `use`, e.g. `use ExUnit.Case, async: true`. When not given explicitly, they default to an empty list.

## Behaviours

Behaviours allow us to define interfaces (sets of functions and macros) in a _behaviour module_ that can be later implemented by different _callback modules_. Thanks to the shared interface, those callback modules can be used interchangeably.

~~~~exercism/note
Note the British spelling of "behaviours".
~~~~

### Defining behaviours

To define a behaviour, we need to create a new module and specify a list of functions that are part of the desired interface. Each function needs to be defined using the `@callback` module attribute. The syntax is identical to a [function typespec][concept-typespecs] (`@spec`). We need to specify a function name, a list of argument types, and all the possible return types.

```elixir
defmodule Countable do
  @callback count(collection :: any) :: pos_integer
end
```

### Implementing behaviours

To add an existing behaviour to our module (create a callback module) we use the `@behaviour` module attribute. Its value should be the name of the behaviour module that we're adding.

Then, we need to define all the functions (callbacks) that are required by that behaviour module. If we're implementing somebody else's behaviour, like Elixir's built-in `Access` or `GenServer` behaviours, we would find the list of all the behaviour's callbacks in the documentation on [hexdocs.pm][hexdocs].

A callback module is not limited to implementing only the functions that are part of its behaviour. It is also possible for a single module to implement multiple behaviours.

To mark which function comes from which behaviour, we should use the module attribute `@impl` before each function. Its value should be the name of the behaviour module that defines this callback.

```elixir
defmodule BookCollection do
  @behaviour Countable

  defstruct :list, :owner

  @impl Countable
  def count(collection) do
    Enum.count(collection.list)
  end

  def mark_as_read(collection, book) do
    # other function unrelated to the Countable behaviour
  end
end
```

### Default callback implementations

When defining a behaviour, it is possible to provide a default implementation of a callback. This implementation should be defined in the quoted expression of the `__using__/1` macro. To make it possible for users of the behaviour module to override the default implementation, call the `defoverridable/1` macro after the function implementation. It accepts a keyword list of function names as keys and function arities as values.

```elixir
defmodule Countable do
  @callback count(collection :: any) :: pos_integer

  defmacro __using__(_) do
    quote do
      @behaviour Countable
      def count(collection), do: Enum.count(collection)
      defoverridable count: 1
    end
  end
end
```

Note that defining functions inside of `__using__/1` is discouraged for any other purpose than defining default callback implementations, but you can always define functions in another module and import them in the  `__using__/1` macro.

[concept-ast]: https://exercism.org/tracks/elixir/concepts/ast
[concept-typespecs]: https://exercism.org/tracks/elixir/concepts/typespecs
[hexdocs]: https://hexdocs.pm

## Instructions

Your friend, an aspiring artist, reached out to you with a project idea. Let's combine his visual creativity with your technical expertise. It's time to dabble in [generative art][generative-art]!

Constraints help creativity and shorten project deadlines, so you've both agreed to limit your masterpiece to a single shape - the circle. But there's going to be many circles. And they can move around! You'll call it... dancing dots.

Your friend will definitely want to come up with new elaborate movements for the dots, so you'll start coding by creating an architecture that will allow you to later define new animations easily.

## 1. Define the animation behaviour

Each animation module needs to implement two callbacks: `init/1` and `handle_frame/3`. Define them in the `Animation` module.

Define the `init/1` callback. It should take one argument of type `opts` and return either an `{:ok, opts}` tuple or `{:error, error}` tuple. Implementations of this callback will check if the given options are valid for this particular type of animation.

Define the `handle_frame/3` callbacks. It should take three arguments - the dot, a frame number, and options. It should always return a dot. Implementations of this callback will modify the dot's attributes based on the current frame number and the animation's options.

## 2. Provide a default implementation of the `init/1` callback

The `Animation` behaviour should be easy to incorporate into other modules by calling `use DancingDots.Animation`.

To make that happen, implement the `__using__` macro in the `Animation` module so that it sets the `Animation` module as the other module's behaviour. It should also provide a default implementation of the `init/1` callback. The default implementation of `init/1` should return the given options unchanged.

```elixir
defmodule MyCustomAnimation do
  use DancingDots.Animation
end

MyCustomAnimation.init([some_option: true])
# => {:ok, [some_option: true]}
```

## 3. Implement the `Flicker` animation

Use the `Animation` behaviour to implement a flickering animation.

It should use the default `init/1` callback because it doesn't take any options.

Implement the `handle_frame/3` callback. In every 4th frame, it should return the dot with half of its original opacity. In other frames, it should return the dot unchanged.

Frames are counted from `1`. The dot passed to `handle_frame/3` is always the dot in its original state, not in the state from the previous frame.

```elixir
dot = %DancingDots.Dot{x: 100, y: 100, radius: 24, opacity: 1}

DancingDots.Flicker.handle_frame(dot, 1, [])
# => %DancingDots.Dot{opacity: 1, radius: 24, x: 100, y: 100}

DancingDots.Flicker.handle_frame(dot, 4, [])
# => %DancingDots.Dot{opacity: 0.5, radius: 24, x: 100, y: 100}
```

## 4. Implement the `Zoom` animation

Use the `Animation` behaviour to implement a zooming animation.

This animation takes one option - velocity. Velocity can be any number. If it's negative, the dot gets zoomed out instead of zoomed in.

Implement the `init/1` callback. It should validate that the passed options is a keyword list with a `:velocity` key. The value of velocity must be a number. If it's not a number, return the error `"The :velocity option is required, and its value must be a number. Got: #{inspect(velocity)}"`.

Implement the `handle_frame/3` callback. It should return the dot with its radius increased by the current frame number, minus one, times velocity.

Frames are counted from `1`. The dot passed to `handle_frame/3` is always the dot in its original state, not in the state from the previous frame.

```elixir
DancingDots.Zoom.init([velocity: nil])
# => {:error, "The :velocity option is required, and its value must be a number. Got: nil"}

dot = %DancingDots.Dot{x: 100, y: 100, radius: 24, opacity: 1}

DancingDots.Zoom.handle_frame(dot, 1, [velocity: 10])
# => %DancingDots.Dot{radius: 24, opacity: 1, x: 100, y: 100}

DancingDots.Zoom.handle_frame(dot, 2, [velocity: 10])
# => %DancingDots.Dot{radius: 34, opacity: 1, x: 100, y: 100}
```

[generative-art]: https://en.wikipedia.org/wiki/Generative_art

## Source

### Created by

- @angelikatyborska

### Contributed to by

- @jiegillet
# Hints

## General

- Don't worry about how the arguments are derived, just focus on combining the arguments to return the intended result.
- Unison has [specific rules for operator precedence][operator-precedence], remember to use parentheses if you need to order function application differently

## 1. Define if Pac-Man can eat a ghost

- You need to define a function with 2 arguments. The first argument is a [boolean][boolean] value, whether pac-man has a power pellet active. The second argument is a [boolean][boolean] value, whether pac-man is touching a ghost.
- The function must return a [boolean][boolean] value.
- You can use the [boolean][boolean] operator `&&` to combine the arguments for a result.

## 2. Define if Pac-Man scores

- You need to define a function with 2 arguments. The first argument is a [boolean][boolean] value, whether pac-man is touching a power pellet. The second argument is a [boolean][boolean] value, whether pac-man is touching a dot.
- The function must return a [boolean][boolean] value.
- You can use the [boolean][boolean] operator `||`to combine the arguments for a result.

## 3. Define if Pac-Man loses

- You need to define a function with 2 arguments. The first argument is a [boolean][boolean] value, whether pac-man has a power pellet active. The second argument is a [boolean][boolean] value, whether pac-man is touching a ghost.
- The function must return a [boolean][boolean] value.
- You can use the [boolean][boolean] operators `&&` and `not` to combine the arguments for a result.

## 4. Define if Pac-Man wins

- You need to define a function with 3 arguments. The second argument is a [boolean][boolean] value, whether pac-man has eaten all of the dots. The first argument is a [boolean][boolean] value, whether pac-man has a power pellet active. The second argument is a [boolean][boolean] value, whether pac-man is touching a ghost.
- The function must return a [boolean][boolean] value.
- You can use the [boolean][boolean] operators `&&` and `not` to combine the arguments and results of invoked functions.

[boolean]: https://elixir-lang.org/getting-started/basic-types.html#booleans
[operator-precedence]: https://www.unison-lang.org/learn/fundamentals/values-and-functions/function-application-operators/
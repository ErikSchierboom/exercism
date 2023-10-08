# Hints

## 1. Define the expected oven time in minutes

- You need to define a [constant][constants] that should contain the [integer][integers] value specified in the recipe.
- The constant needs to be defined in the `Lasagna` [class][classes].
- It needs to be defined outside of a method.

## 2. Calculate the remaining oven time in minutes

- You need to define a [method][methods] with a single parameter for the actual time so far.
- You can use the mathematical operator(`-`) to subtract values.
- It is possible to use the [constant][constants] you've defined previously.

## 3. Calculate the preparation time in minutes

- You need to define a [method][methods] with a single parameter for the number of layers.
- You can use the mathematical operator(`*`) to multiply values.

## 4. Calculate the total working time in minutes

- You need to define a [method][methods] with two named parameters.
- You can call one of the other methods you've defined previously.
- You can use the mathematical operator(`+`) to add values.

[constants]: https://crystal-lang.org/reference/syntax_and_semantics/constants.html
[integers]: https://crystal-lang.org/reference/latest/syntax_and_semantics/literals/integers.html
[classes]: https://crystal-lang.org/reference/latest/syntax_and_semantics/classes_and_methods.html#classes-and-methods
[methods]: https://crystal-lang.org/reference/latest/tutorials/basics/60_methods.html
# Hints

## General

- Don't worry about which running state the machine is in, e.g the machine wont be running when you plug it in.

## 1. Debug light

- You need to define a class with the name `JuiceMaker`.
- You need to define a [class method][class-methods] that returns `true`.

## 2. Initialize the machine

- Create a [constructor][new-initialize] for the class `JuiceMaker`.
- Create an [instance variable][instance-variable] `@running` that is set to `false`.
- Create an [instance variable][instance-variable] `@fluid` that is set to the amount of the argument passed to the constructor.

## 3. Turn on the machine

- Define an instance method called `start`.
- Set the [instance variable][instance-variable] `@running` to `true`.

## 4. Status of the machine

- Define an instance method called `running?`.
- Return the [instance variable][instance-variable] `@running`.

## 5. Add juice

- Define an instance method called `add_juice`, that takes an integer as an argument.
- Set the [instance variable][instance-variable] `@fluid` to the sum of the current value of `@fluid` and the argument passed to the method.

## 6. Turn off the machine

- Define an instance method called `stop`, that takes an integer as an argument.
- Set the [instance variable][instance-variable] `@running` to `false`.
- Set the [instance variable][instance-variable] `@fluid` to the current value of `@fluid` minus the argument passed to the method times 5.

[class-methods]: https://crystal-lang.org/reference/latest/syntax_and_semantics/class_methods.html#class-methods
[new-initialize]: https://crystal-lang.org/reference/latest/syntax_and_semantics/new%2C_initialize_and_allocate.html
[instance-variable]: https://crystal-lang.org/reference/latest/syntax_and_semantics/methods_and_instance_variables.html
# Ellen's Alien Game

Welcome to Ellen's Alien Game on Exercism's C++ Track.
If you need help running the tests or submitting your code, check out `HELP.md`.
If you get stuck on the exercise, check out `HINTS.md`, but try and solve it without using those first :)

## Introduction

## Classes

It is time to get to one of the core paradigms of C++: object-oriented programming (OOP).
OOP is centered around `classes` - user-defined types of data with their own set of related functions.
We will start with the basics and will cover more advanced topics further down the syllabus tree.

### Members

Classes can have **member variables** and **member functions**.
They are accessed by the **member selection** operator `.`.
Just as variables outside of `classes`, it is advisable to initialize member variables with a value upon declaration.
This value will then become the default for newly created objects of this class.

### Encapsulation and Information Hiding

Classes offer the option to restrict access to their members.
The two basic `access specifiers` are `private` and `public`.
`private` members are not accessible from outside the class.
`public` members can be accessed freely.
All members of a `class` are `private` by default.
Only members explicitly marked with `public` are freely usable outside of the class.

### Basic example

The definition of a `class` can be seen in the following example.
Notice the `;` after the definition:

```cpp
class Wizzard {
  public:               // from here on all members are publicly accessible
    inc cast_spell() {  // defines the public member function cast_spell
      return damage;
    }
    std::string name{}; // defines the public member variable `name`
  private:              // from here on all members are private
    int damage{5};      // defines the private member variable `damage`
};

```

You can access all member variables from within the class.
Take a look at `damage` inside the `cast_spell` function.
You cannot read or change `private` members outside of the class:

```cpp
Wizzard silverhand{};
// calling the `cast_spell` function is okay, it is public:
silverhand.cast_spell();
// => 5

// name is public and can be changed:
silverhand.name = "Laeral";

// damage is private:
silverhand.damage = 500; 
 // => Compilation error
```

### Constructors

Constructors offer the possibility to assign values to member variables at object creation.
They have the same name as the `class` and do not have a return type.
A class can have several constructors.
This is useful if you do not always have a need to set all variables.
Sometimes you might want to keep everything at default but change the `name` variable.
In the case of a significant Wizzard you might want to change the damage as well, so you need two `constructors`.

```cpp
class Wizzard {
  public:
    Wizzard(std::string new_name) {
      name = new_name;
    }
    Wizzard(std::string new_name, int new_damage) {
      name = new_name;
      damage = new_damage;
    }
    int cast_spell() {
      return damage;
    }
    std::string name{};
  private:
    int damage{5};
};

Wizzard el{"Eleven"};       // deals  5 damage
Wizzard vecna{"Vecna", 50}; // deals 50 damage
```

Constructors are a big topic and have many nuances.
If you are not explicitly defining a `constructor` for your `class`, then - and only then - the compiler will do the job for you.
This has happened in the first example above.
The _silverhand_ object is created by calling the default constructor, no arguments were passed.
All variables are set to the value that was stated in the definition of the class.
If you had not given any values in that definition, the variables might be uninitialized, which might have unintended consequences.

~~~~exercism/note
## Structs

Structs came from the language's original C roots and are as old as C++ itself.
They are effectively the same thing as `classes` with one important exception.
By default, everything in a `class` is `private`.
Structs, on the other hand, are `public` until defined otherwise.
Conventionally, the `struct` keyword is often used for **data-only structures**.
The `class` keyword is preferred for objects that need to ensure certain properties.
Such an invariant could be that the `damage` of your `Wizzard` `class` cannot turn negative.
The `damage` variable is private and any function that changes the damage would ensure the invariant is preserved.
~~~~

## Instructions

Ellen is making a game where the player has to fight aliens.
She has just learned about Object Oriented Programming (OOP) and is eager to take advantage of what using `classes` could offer her program.

To Ellen's delight, you have offered to help and she has given you the task of programming the aliens that the player has to fight.


## 1. Create the `Alien` Class

Define the `Alien` class with a constructor that accepts two `int` parameters `x` and `y`, putting them into `x_coordinate` and `y_coordinate` member variables.
Every alien will also start off with a health level of `3`, so the `health` member variable should be initialized as well.

`health` should be a private member variable.
To let other parts of the program read the health information, Ellen wants to have a `public` `get_health()` method which returns an `int`.

```cpp
Alien alien{2, 0};
alien.x_coordinate;
// => 2
alien.y_coordinate;
// => 0
alien.get_health();
// => 3
```

Now, each alien should be able to internally track its own position and health.

## 2. The `hit` Function

Ellen would like the Alien `class` to have a `hit` method that decrements the health of an alien object by `1` when called.
This way, she can simply call `some_alien_instance.hit()` instead of having to manually change an alien's health.
Make sure that the health points do not drop below zero.
The function should return `true`.
Ellen wants to introduce shields at a later point, which would then report `false` if the shield is up.

```cpp
Alien alien {0, 0};
alien.get_health(); 
// => 3 (Initial health value)

alien.hit(); // Decrements health by 1 point.
alien.get_health();
// => 2
```

## 3. The `is_alive` Function

You realize that if the health keeps decreasing, at some point it will probably hit `0`.
It would be a good idea to add an `is_alive` method that Ellen can quickly call to check if the alien is... well... alive. 😉
`some_alien_instance.is_alive()` should return a boolean.

```cpp
alien.get_health();
// => 1
alien.is_alive();
// => true
alien.hit();
alien.get_health();
// => 0
alien.is_alive();
// => false
```

## 4. The `teleport` Function

In Ellen's game, the aliens can teleport!
You will need to write a `teleport` method that takes `x_new` and `y_new` values, and changes the alien's coordinates accordingly.
For the time being, the function should return `true`.
Ellen wants to add teleport-blocking bombs in later levels, which would then report `false` for failed teleporting attempts.

```cpp
alien.teleport(5, -4);
alien.x_coordinate;
// => 5
alien.y_coordinate;
// => -4
```

## 5. The `collision_detection` Function

If the aliens can be hit by something, then they need to be able to detect when such a collision might occur.
Ellen needs to know if two aliens occupy the same coordinates. 
The `collision_detection()` function takes another alien object as an argument and returns a `bool`.

```cpp
Alien lrrr {3, 6};
Alien ndnd {-2, 12};
lrrr.collision_detection(ndnd);
// => false
ndnd.teleport(3, 6);
ndnd.collision_detection(lrrr);
// => true
```

## Source

### Created by

- @vaeng
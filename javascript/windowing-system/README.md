# Windowing System

Welcome to Windowing System on Exercism's JavaScript Track.
If you need help running the tests or submitting your code, check out `HELP.md`.
If you get stuck on the exercise, check out `HINTS.md`, but try and solve it without using those first :)

## Introduction

JavaScript includes the capabilities for object-oriented programming ([OOP][wiki-oop]).
In OOP, you want to create objects (_instances_) from "templates" (_classes_) so that they include certain data and functionality.
The data properties are called _fields_ in the OOP context, function properties are called _methods_.

JavaScript did not have classes at all before they were added to the language specification in 2015 but allowed for object-oriented programming using prototype-based inheritance.
And even though a `class` keyword is available nowadays, JavaScript is still a _prototype-based_ language.

To understand what it means to be a prototype-based language and how JavaScript works, we will go back to the time when there were no classes.

## Prototype Syntax

### Constructor Function

In JavaScript, the template (class) is facilitated by a regular function.
When a function is supposed to be used as such a template, it is called a _constructor function_ and the convention is that the function name should start with a capital letter.
Instances (objects) are derived from the template using the `new` keyword when invoking the constructor function.

```javascript
function Car() {
  // ...
}

const myCar = new Car();
const yourCar = new Car();
```

It is important to note that in JavaScript, the instances and the constructor function keep a relationship to each other even after the instances were created.
Every instance object includes a hidden, internal property referred to as `[[prototype]]` in the language specification.
It holds a reference to the value of the `prototype` key of the constructor function.
Yes, you read that correctly, a JavaScript function can have key/value pairs because it is also an object behind the scenes.

```exercism/note
To summarize:

- Constructors in JavaScript are regular functions.
- Constructing a new instance creates an object with a relation to its constructor called its _prototype_.
- Functions are objects (callable objects) and therefore they can have properties.
- The constructor's (function) `prototype` property will become the instance's _prototype_.
```

### Instance Fields

Often, you want all the derived objects (instances) to include some fields and pass some initial values for those when the object is constructed.
This can be facilitated via the [`this` keyword][mdn-this].
Inside the constructor function, `this` represents the new object that will be created via `new`.
`this` is automatically returned from the constructor function when it is called with `new`.

That means we can add fields to the new instance by adding them to `this` in the constructor function.

```javascript
function Car(color, weight) {
  this.color = color;
  this.weight = weight;
  this.engineRunning = false;
}

const myCar = new Car('red', '2mt');
myCar.color;
// => 'red'
myCar.engineRunning;
// => false
```

### Instance Methods

Methods are added via the `prototype` property of the constructor function.
Inside a method, you can access the fields of the instance via `this`.
This works because of the following general rule.

> When a function is called as a method of an object, its `this` is set to the object the method is called on. [^1]

```javascript
function Car() {
  this.engineRunning = false;
  // ...
}

Car.prototype.startEngine = function () {
  this.engineRunning = true;
};

Car.prototype.addGas = function (litre) {
  // ...
};

const myCar = new Car();
myCar.startEngine();
myCar.engineRunning;
// => true
```

### The Prototype Chain

`myCar` in the example above is a regular JavaScript object and if we would inspect it (e.g. in the browser console), we would not find a property `startEngine` with a function as a value directly inside the `myCar` object.
So how does the code above even work then?

The secret here is called the _prototype chain_.
When you try to access any property (field or method) of an object, JavaScript first checks whether the respective key can be found directly in the object itself.
If not, it continues to look for the key in the object referenced by the `[[prototype]]` property of the original object.
As mentioned before, in our example `[[prototype]]` points to the `prototype` property of the constructor function.
That is where JavaScript would find the `startEngine` function because we added it there.

```javascript
function Car() {
  // ...
}

Car.prototype.startEngine = function () {
  // ...
};
```

And the chain does not end there.
The `[[prototype]]` property of `Car.prototype` (`myCar.[[prototype]].[[prototype]]`) references `Object.prototype` (the `prototype` property of the `Object` constructor function).
It contains general methods that are available for all JavaScript objects, e.g. `toString()`.
In conclusion, you can call `myCar.toString()` and that method will exist because JavaScript searches for that method throughout the whole prototype chain.

```exercism/caution
Note that the prototype chain is only travelled when retrieving a value.
Setting a property directly or deleting a property of an instance object only targets that specific instance.
This might not be what you would expect when you are used to a language with class-based inheritance.
```

## Class Syntax

Nowadays, JavaScript supports defining classes with a `class` keyword.
This was added to the language specification in 2015.
On the one hand, this provides syntactic sugar that makes classes easier to read and write.
The new syntax is more similar to how classes are written in languages like C++ or Java.
Developers switching over from those languages have an easier time adapting.
On the other hand, class syntax paves the way for new language features that are not available in the prototype syntax.

### Class Declarations

With the new syntax, classes are defined with the `class` keyword, followed by the name of the class and the class body in curly brackets.
The body contains the definition of the constructor function, i.e. a special method with the name `constructor`.
This function works just like the constructor function in the prototype syntax.
The class body also contains all method definitions.
The syntax for the methods is similar to the shorthand notation we have seen for adding functions as values inside an object, see [Concept Objects][concept-objects].

```javascript
class Car {
  constructor(color, weight) {
    this.color = color;
    this.weight = weight;
    this.engineRunning = false;
  }

  startEngine() {
    this.engineRunning = true;
  }

  addGas(litre) {
    // ...
  }
}

const myCar = new Car();
myCar.startEngine();
myCar.engineRunning;
// => true
```

Keep in mind that behind the scenes, JavaScript is still a prototype-based language.
All the mechanisms we learned about in the "Prototype Syntax" section above still apply.

### Private Fields, Getters and Setters

By default, all instance fields are public in JavaScript.
They can be directly accessed and assigned to.

However, there is an established convention that fields and methods that start with an underscore should be treated as private.
They should never be accessed directly from outside the class.

Private fields are sometimes accompanied by [getters][mdn-get] and [setters][mdn-set].
With the keywords `get` and `set` you can define functions that are executed when a property with the same name as the function is accessed or assigned to.

```javascript
class Car {
  constructor() {
    this._milage = 0;
  }

  get milage() {
    return this._milage;
  }

  set milage(value) {
    throw new Error(`Milage cannot be manipulated, ${value} is ignored.`);
    // Just an example, usually you would not provide a setter in this case.
  }
}

const myCar = new Car();
myCar.milage;
// => 0
myCar.milage = 100;
// => Error: Milage cannot be manipulated, 100 is ignored.
```

---

[^1]: `this` Examples - As an object method, MDN. <https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators/this#as_an_object_method> (referenced December 03, 2021)

[wiki-oop]: https://en.wikipedia.org/wiki/Object-oriented_programming
[mdn-get]: https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Functions/get
[mdn-set]: https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Functions/set
[mdn-this]: https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators/this
[concept-objects]: /tracks/javascript/concepts/objects

## Instructions

In this exercise, you will be simulating a windowing based computer system.
You will create some windows that can be moved and resized.
The following image is representative of the values you will be working with below.

```
                  <--------------------- screenSize.width --------------------->

       ^          ╔════════════════════════════════════════════════════════════╗
       |          ║                                                            ║
       |          ║          position.x,_                                      ║
       |          ║          position.y  \                                     ║
       |          ║                       \<----- size.width ----->            ║
       |          ║                 ^      *──────────────────────┐            ║
       |          ║                 |      │        title         │            ║
       |          ║                 |      ├──────────────────────┤            ║
screenSize.height ║                 |      │                      │            ║
       |          ║            size.height │                      │            ║
       |          ║                 |      │       contents       │            ║
       |          ║                 |      │                      │            ║
       |          ║                 |      │                      │            ║
       |          ║                 v      └──────────────────────┘            ║
       |          ║                                                            ║
       |          ║                                                            ║
       v          ╚════════════════════════════════════════════════════════════╝
```

📣 To practice your wide range of JavaScript skills, **try to solve tasks 1 and 2 with prototype syntax and the remaining tasks with class syntax**.

## 1. Define Size for storing the dimensions of the window

Define a class (constructor function) named `Size`.
It should have two fields `width` and `height` that store the window's current dimensions.
The constructor function should accept initial values for these fields.
The width is provided as the first parameter, the height as the second one.
The default width and height should be `80` and `60`, respectively.

Additionally, define a method `resize(newWidth, newHeight)` that takes a new width and height as parameters and changes the fields to reflect the new size.

```javascript
const size = new Size(1080, 764);
size.width;
// => 1080
size.height;
// => 764

size.resize(1920, 1080);
size.width;
// => 1920
size.height;
// => 1080
```

## 2. Define Position to store a window position

Define a class (constructor function) named `Position` with two fields, `x` and `y` that store the current horizontal and vertical position, respectively, of the window's upper left corner.
The constructor function should accept initial values for these fields.
The value for `x` is provided as the first parameter, the value for `y` as the second one.
The default value should be `0` for both fields.

The position (0, 0) is the upper left corner of the screen with `x` values getting larger as you move right and `y` values getting larger as you move down.

Also define a method `move(newX, newY)` that takes new x and y parameters and changes the properties to reflect the new position.

```javascript
const point = new Position();
point.x;
// => 0
point.y;
// => 0

point.move(100, 200);
point.x;
// => 100
point.y;
// => 200
```

## 3. Define a ProgramWindow class

Define a `ProgramWindow` class with the following fields:

- `screenSize`: holds a fixed value of type `Size` with `width` 800 and `height` 600
- `size` : holds a value of type `Size`, the initial value is the default value of the `Size` instance
- `position` : holds a value of type `Position`, the initial value is the default value of the `Position` instance

When the window is opened (created), it always has the default size and position in the beginning.

```javascript
const programWindow = new ProgramWindow();
programWindow.screenSize.width;
// => 800

// Similar for the other fields.
```

Side note: The name `ProgramWindow` is used instead of `Window` to differentiate the class from the built-in `Window` class that exists in browser environments.

## 4. Add a method to resize the window

The `ProgramWindow` class should include a method `resize`.
It should accept a parameter of type `Size` as input and attempts to resize the window to the specified size.

However, the new size cannot exceed certain bounds.

- The minimum allowed height or width is 1.
  Requested heights or widths less than 1 will be clipped to 1.
- The maximum height and width depend on the current position of the window, the edges of the window cannot move past the edges of the screen.
  Values larger than these bounds will be clipped to the largest size they can take.
  E.g. if the window's position is at `x` = 400, `y` = 300 and a resize to `height` = 400, `width` = 300 is requested, then the window would be resized to `height` = 300, `width` = 300 as the screen is not large enough in the `y` direction to fully accommodate the request.

```javascript
const programWindow = new ProgramWindow();

const newSize = new Size(600, 400);
programWindow.resize(newSize);
programWindow.size.width;
// => 600
programWindow.size.height;
// => 400
```

## 5. Add a method to move the window

Besides the resize functionality, the `ProgramWindow` class should also include a method `move`.
It should accept a parameter of type `Position` as input.
The `move` method is similar to `resize` however, this method adjusts the _position_ of the window to the requested value, rather than the size.

As with `resize` the new position cannot exceed certain limits.

- The smallest position is 0 for both `x` and `y`.
- The maximum position in either direction depends on the current size of the window.
  The edges cannot move past the edges of the screen.
  Values larger than these bounds will be clipped to the largest size they can take.
  E.g. if the window's size is at `x` = 250, `y` = 100 and a move to `x` = 600, `y` = 200 is requested, then the window would be moved to `x` = 550, `y` = 200 as the screen is not large enough in the `x` direction to fully accommodate the request.

```javascript
const programWindow = new ProgramWindow();

const newPosition = new Position(50, 100);
programWindow.move(newPosition);
programWindow.position.x;
// => 50
programWindow.position.y;
// => 100
```

## 6. Change a program window

Implement a `changeWindow` function that accepts a `ProgramWindow` instance as input and changes the window to the specified size and position.
The function should return the `ProgramWindow` instance that was passed in after the changes were applied.

The window should get a width of 400, a height of 300 and be positioned at x = 100, y = 150.

```javascript
const programWindow = new ProgramWindow();
changeWindow(programWindow);
programWindow.size.width;
// => 400

// Similar for the other fields.
```

## Source

### Created by

- @junedev

### Contributed to by

- @SleeplessByte
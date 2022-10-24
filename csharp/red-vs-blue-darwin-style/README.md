# Red vs. Blue: Darwin Style

Welcome to Red vs. Blue: Darwin Style on Exercism's C# Track.
If you need help running the tests or submitting your code, check out `HELP.md`.
If you get stuck on the exercise, check out `HINTS.md`, but try and solve it without using those first :)

## Introduction

Namespaces are a way to group related code and to avoid name clashes and are generally present in all but the most trivial code base.

The syntax is as follows:

```csharp
namespace MyNameSpace
{
    public class MyClass {}

    public class OtherClass {}
}
```

Types enclosed in namespaces are referred to outside the scope of the namespace by prefixing the type name with the dot syntax. Alternatively, and more usually, you can place a `using` directive at the top of the file (or within a namespace) and type can be used without the prefix. Within the same namespace there is no need to qualify type names.

```csharp
namespace MySpace
{
    public class MyClass {}

    public class Foo
    {
        public void Bar()
        {
            var baz = new MyClass();
        }
    }
}

public class Qux
{
    public void Box()
    {
        var nux = new MySpace.MyClass();
    }
}

namespace OtherSpace
{
    using MySpace;

    public class Tix
    {
        public void Jeg()
        {
            var lor = new MyClass();
        }
    }
}
```

You can alias a namespace with the syntax `using MyAlias = MySpace;` and then use the alias anywhere that the namespace could be used.

## Instructions

Management are starting to apply Darwinian principles to the Remote Control Car project [exercise:csharp/remote-control-competition](). The developers have been split into two teams, _Red_ and _Blue_, and are tasked with improving the design independently of each other. They don't need to concern themselves with design decisions of the other team.

You have been asked to take a look at the code and see how you can best combine the two efforts for testing purposes.

## 1. Find a more appropriate way of isolating the code of the two teams

Please use `namespaces` to better express the intention of the code.

Currently, important types like `Motor` and `Telemetry`, not to mention `RemoteControlCar` itself, are nested within an enclosing static class, `<Color>RemoteControlCarTeam`. The only purpose of the enclosing class is to allow types with the same name to coexist in the program. That is better expressed by using a namespace. You will see in the next exercise that, for these purposes, a `namespace` has advantages over a `static class`.

## 2. Simplify the naming system

Whilst management are adamant that the teams should be called `RedRemoteControlCarTeam` and `BlueRemoteControlCarTeam` in the definitions, the names are rather cumbersome when referencing the teams. Find a way to use the shorter identifiers `Red` and `Blue` when building the cars.

## Source

### Created by

- @mikedamay

### Contributed to by

- @ErikSchierboom
- @valentin-p
- @yzAlvin
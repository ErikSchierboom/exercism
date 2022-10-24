# Orm in One Go

Welcome to Orm in One Go on Exercism's C# Track.
If you need help running the tests or submitting your code, check out `HELP.md`.
If you get stuck on the exercise, check out `HINTS.md`, but try and solve it without using those first :)

## Introduction

You saw in [exercise:csharp/object-relational-mapping]() that the `IDispose` interface could be used to signal that some object's resource or other program state needed to be released or reset when the object was no longer required (and that relying on the garbage collector would not achieve this or provide the required level of control) and that `IDisposable.Dispose()` method was the natural place for such cleanup operations.

There is another construct, the `using` block, that enables, from the caller's perspective, all the resource lifetime management to be gathered into a single statement.

```csharp
using (var file = new File("my_secrets"))
{
    file.WriteSecret("xxxxxxx");
}
```

In the above example the file system resources associated with `file` will be released back to the operating system when the `using` block is exited.

For the pattern to work the variable in the using statement must be a reference type that implements the `IDisposable` interface and must release resources/reset program state in its `Dispose()` method.

C# 8 introduces a refinement to the pattern. A using statement can placed at the beginning of a block.

```csharp
using var drawingResource = some_provided_or_new_object;
try
{
    drawingResource.DrawSomething();
}
catch (Exception)
{
    throw;
}
```

Java developers may recognize this as an analog of the _automatic resource management_ mechanism introduced in Java 7.

## Instructions

You are back working on the ORM (Object Relationship Mapping) system introduced in [exercise:csharp/object-relational-mapping]().

Our ORM usage analysis shows that 95% of transactions are executed from within one calling method, and it has been decided that it would be more appropriate to have a single ORM method that opened, wrote and committed a transaction.

The database has the following instance methods:

- `Database.BeginTransaction()` starts a transaction on the database.
- `Database.Write(string data)` writes data to the database within the transaction. If it receives bad data an exception will be thrown. An attempt to call this method without `BeginTransction()` having been called will cause an exception to be thrown. If successful the internal state of the database will change to `DataWritten`.
- `Database.EndTransaction()` commits the transaction to the database. It may throw an exception if it can't close the transaction or if `Database.BeginTransaction()` had not been called.
- A call to`Databse.Dispose()` will clean up the database if an exception is thrown during a transaction. This will change the state of the database to `Closed`.

## 1. Write to the database

Implement the `Orm.Write()` method to begin a database transaction, write the data passed in and commit the transaction. All exceptions including `InvalidOperationException` should be allowed to pass to the caller without logging or any other intervention.

```csharp
Database db = new Database();
Orm orm = new Orm(db);
orm.Write("good write");
// => database has an internal state of State.Closed
orm.Write("bad write");
// => an exception is thrown but database is left with an internal state of State.Closed
orm.Write("bad commit");
// => an exception is thrown but database is left with an internal state of State.Closed
```

## 2. Write to the database and return an indication of whether the write was successful to the caller

It has been a few months since `Orm.Write()` was introduced and there is division in the team. Many developers would like the _ORM_ to handle errors when exceptions are thrown and simply return an indication of success to the caller.

Please implement the `Orm.WriteSafely()` method to begin a database transaction, write the data passed in and commit the transaction (as above). It should return `true` if the _write_ was successful, otherwise `false`. Do not attempt to log the exception.

```csharp
Database db = new Database();
Orm orm = new Orm(db);
orm.WriteSafely("good write");
// => true
orm.WriteSafely("bad write");
// => false
orm.WriteSafely("bad commit");
// => false
```

## Source

### Created by

- @mikedamay

### Contributed to by

- @ErikSchierboom
- @yzAlvin
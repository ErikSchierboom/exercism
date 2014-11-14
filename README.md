# Exercism.io Visual Studio Template #

This is a Visual Studio template to work on the problems from [exercism.io](http://exercism.io) in as many languages as Visual Studio supports.

![Solution Explorer](https://raw.githubusercontent.com/rprouse/Exercism.VisualStudio/master/images/SolutionExplorer.png)

[exercism.io](http://exercism.io) is a series of programming exercises in multiple languages in which you are given a problem and a series of unit tests to verify your solution to the problem. Once you have solved the problem, you submit your answer to [exercism.io](http://exercism.io) and it is reviewed by your peers. It is an excellent practice in Test Driven Development and a great opportunity to write code that solves a problem as simply as possible while keeping it readable and expressive.

So far, there are exercises available in available in Clojure, CoffeeScript, C++, C#, Elixir, Erlang, F#, Go, Haskell, JavaScript, Lua, Objective-C, OCaml, Perl 5, Python, Ruby, Scala, and Swift. This template allows you to work in C#, F#, Python, JavaScript and CoffeeScript.

To use this template,

1. Copy the template into your exercises directory, for example `C:\src\exercises`
2. Install the [Exercism CLI](http://help.exercism.io/installing-the-cli.html)
3. Open a command prompt to your exercise directory 
4. Add your API key to exercism `exercism configure --key=YOUR_API_KEY`
5. Configure your source directory in exercism `exercism configure --dir=C:\src\exercises`
6. [Fetch your first exercise](http://help.exercism.io/fetching-exercises.html) `exercism fetch csharp`
7. Open the Exercism solution in Visual Studio
8. Expand the project that you fetched the exercise for
9. Click on **Show All Files** in Solution Explorer (See below)
10. The exercise you just fetched will appear greyed out. Right click on the folder and **Include In Project**
11. Get coding...

![Add files](https://raw.githubusercontent.com/rprouse/Exercism.VisualStudio/master/images/AddFiles.png)

The following are language specific setup and hints. If you are using Visual Studio Express, none of the extensions I mention will work, but you should be able to run all of the tests at the command line. With the extensions, you can run the tests for most languages from right within Visual Studio.

![Test Explorer](https://raw.githubusercontent.com/rprouse/Exercism.VisualStudio/master/images/TestExplorer.png)

## C# ##

[Exercism C# Help.](http://help.exercism.io/getting-started-with-csharp.html)

The NUnit NuGet package is included in the project, so you should be off and running.

If you install the [NUnit Visual Studio Test Adapter](https://visualstudiogallery.msdn.microsoft.com/6ab922d0-21c0-4f06-ab5f-4ecd1fe7175d), you can run the tests from within Visual Studio. If you have ReSharper installed, you can also [run the tests using ReSharper](https://www.jetbrains.com/resharper/features/unit_testing.html).

If you are using Visual Studio Express, install [NUnit 2.6.3](http://www.nunit.org/) and run the tests from the command line.

## F# ##

[Exercism F# help.](http://help.exercism.io/getting-started-with-fsharp.html)

By default, Visual Studio does not allow you to organize F# files by folder. This is a problem because Exercism fetches the exercises to sub-folders. To get around this, install the Visual [F# Power Tools extension](http://fsprojects.github.io/VisualFSharpPowerTools/) which enables folder organization and makes writing F# code much easier in Visual Studio.

To add exercises for F#, it is different than the other projects. Right click on the project and select **F# Power Tools | New Folder**. Enter the name for the **existing** exercise folder. Next, right click on the folder and select **Add | Existing item...** and select the problem files in the folder. 

Running the tests is the same as for C#.

## C++ ##

[Exercism C++ help.](http://help.exercism.io/getting-started-with-cpp.html)

Follow the instructions on Exercism.io to install the Boost library. They call for version 1.55. I am using 1.56 and it works fine. 

In order for the C++ project to compile, **you must** set the environment variable `BOOST_ROOT` to the directory you installed boost to. On my system, `BOOST_ROOT=C:\Src\boost\boost_1_56_0`

The C++ project includes all of the exercises in one project, so you can ignore the CMake instructions on Exercism.io. `BOOST_TEST_MAIN` is in `Exercism.cpp`, so **you must delete** the `#define BOOST_TEST_MAIN` line from every exercise that you fetch. 

To run the tests within Visual Studio, I installed the [Boost Unit Test Adapter](https://visualstudiogallery.msdn.microsoft.com/5f4ae1bd-b769-410e-8238-fb30beda987f) extension. It is still a bit flaky, but it generally works.

You can also run the test from the command line by running the `Exercism.cpp.exe` that is built by the project.

To keep things simple, I code the entire problem in the `.h` file and don't use a `.cpp` file. This makes submission to exercism easier. 

## Python ##

[Exercism Python help.](http://help.exercism.io/getting-started-with-python.html)

For Visual Studio, you need to install [Python Tools for Visual Studio](https://visualstudiogallery.msdn.microsoft.com/5f4ae1bd-b769-410e-8238-fb30beda987f). As of version 2.1, you can use Express versions of Visual Studio. Just following their [installation instructions](https://pytools.codeplex.com/wikipage?title=PTVS%20Installation) to install it and a Python interpreter of your choice.

To run the tests, you can do so at the command line, or within Visual Studio.

## JavaScript and CoffeScript ##

Exercism [JavaScript help](http://help.exercism.io/getting-started-with-javascript.html) and [CoffeeScript help](http://help.exercism.io/getting-started-with-coffeescript.html).

Follow the [instructions on Exercism.io](http://help.exercism.io/getting-started-with-javascript.html) to install `Node.js` and `jasmine-node`.

To work with CoffeeScript in Visual Studio, you should install the [Web Essentials](http://vswebessentials.com/) extension. It will also make working with Javascript much easier.

I have not got the unit tests working in Visual Studio yet. I have been trying to get them running using the [Chutzpah Test Adapter](http://mmanela.github.io/chutzpah/), but haven't succeeded yet.

Suggestions or pull requests for this would be welcome. For now, you can run the unit tests from a node.js command line using the batch file in the project.

```
C:\Src\exercises\javascript>test example\bob_test.spec.js
.................

Finished in 0.02 seconds
17 tests, 17 assertions, 0 failures, 0 skipped
```

If you do not see any output from running the tests, you are likely not in a Node.js command prompt.
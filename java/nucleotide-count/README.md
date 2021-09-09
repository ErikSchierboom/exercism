# Nucleotide Count

Welcome to Nucleotide Count on Exercism's Java Track.
If you need help running the tests or submitting your code, check out `HELP.md`.

## Instructions

Each of us inherits from our biological parents a set of chemical instructions known as DNA that influence how our bodies are constructed. All known life depends on DNA!

> Note: You do not need to understand anything about nucleotides or DNA to complete this exercise.

DNA is a long chain of other chemicals and the most important are the four nucleotides, adenine, cytosine, guanine and thymine. A single DNA chain can contain billions of these four nucleotides and the order in which they occur is important!
We call the order of these nucleotides in a bit of DNA a "DNA sequence".

We represent a DNA sequence as an ordered collection of these four nucleotides and a common way to do that is with a string of characters such as "ATTACG" for a DNA sequence of 6 nucleotides.
'A' for adenine, 'C' for cytosine, 'G' for guanine, and 'T' for thymine.

Given a string representing a DNA sequence, count how many of each nucleotide is present.
If the string contains characters that aren't A, C, G, or T then it is invalid and you should signal an error.

For example:

```
"GATTACA" -> 'A': 3, 'C': 1, 'G': 1, 'T': 2
"INVALID" -> error
```

Since this exercise has difficulty 5 it doesn't come with any starter implementation.
This is so that you get to practice creating classes and methods which is an important part of programming in Java.
It does mean that when you first try to run the tests, they won't compile.
They will give you an error similar to:
```
 path-to-exercism-dir\exercism\java\name-of-exercise\src\test\java\ExerciseClassNameTest.java:14: error: cannot find symbol
        ExerciseClassName exerciseClassName = new ExerciseClassName();
        ^
 symbol:   class ExerciseClassName
 location: class ExerciseClassNameTest
```
This error occurs because the test refers to a class that hasn't been created yet (`ExerciseClassName`).
To resolve the error you need to add a file matching the class name in the error to the `src/main/java` directory.
For example, for the error above you would add a file called `ExerciseClassName.java`.

When you try to run the tests again you will get slightly different errors.
You might get an error similar to:
```
  constructor ExerciseClassName in class ExerciseClassName cannot be applied to given types;
        ExerciseClassName exerciseClassName = new ExerciseClassName("some argument");
                                              ^
  required: no arguments
  found: String
  reason: actual and formal argument lists differ in length
```
This error means that you need to add a [constructor](https://docs.oracle.com/javase/tutorial/java/javaOO/constructors.html) to your new class.
If you don't add a constructor, Java will add a default one for you.
This default constructor takes no arguments.
So if the tests expect your class to have a constructor which takes arguments, then you need to create this constructor yourself.
In the example above you could add:
```
ExerciseClassName(String input) {

}
``` 
That should make the error go away, though you might need to add some more code to your constructor to make the test pass!

You might also get an error similar to:
```
  error: cannot find symbol
        assertEquals(expectedOutput, exerciseClassName.someMethod());
                                                       ^
  symbol:   method someMethod()
  location: variable exerciseClassName of type ExerciseClassName
```
This error means that you need to add a method called `someMethod` to your new class.
In the example above you would add:
```
String someMethod() {
  return "";
}
```
Make sure the return type matches what the test is expecting.
You can find out which return type it should have by looking at the type of object it's being compared to in the tests.
Or you could set your method to return some random type (e.g. `void`), and run the tests again.
The new error should tell you which type it's expecting.

After having resolved these errors you should be ready to start making the tests pass!

## Source

### Created by

- @sit

### Contributed to by

- @c-thornton
- @di72nn
- @ErikSchierboom
- @FridaTveit
- @javaeeeee
- @jmrunkle
- @jtigger
- @kytrinyx
- @lemoncurry
- @matthewmorgan
- @mirkoperillo
- @morrme
- @msomji
- @muzimuzhi
- @odzeno
- @redshirt4
- @sjakobi
- @sjwarner-bp
- @SleeplessByte
- @Smarticles101
- @sshine
- @stkent
- @tshradheya
- @vdemeester
- @Zaldrick

### Based on

The Calculating DNA Nucleotides_problem at Rosalind - http://rosalind.info/problems/dna/
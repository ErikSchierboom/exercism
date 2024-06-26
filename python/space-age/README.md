# Space Age

Welcome to Space Age on Exercism's Python Track.
If you need help running the tests or submitting your code, check out `HELP.md`.

## Instructions

Given an age in seconds, calculate how old someone would be on:

- Mercury: orbital period 0.2408467 Earth years
- Venus: orbital period 0.61519726 Earth years
- Earth: orbital period 1.0 Earth years, 365.25 Earth days, or 31557600 seconds
- Mars: orbital period 1.8808158 Earth years
- Jupiter: orbital period 11.862615 Earth years
- Saturn: orbital period 29.447498 Earth years
- Uranus: orbital period 84.016846 Earth years
- Neptune: orbital period 164.79132 Earth years

So if you were told someone were 1,000,000,000 seconds old, you should
be able to say that they're 31.69 Earth-years old.

If you're wondering why Pluto didn't make the cut, go watch [this YouTube video][pluto-video].

Note: The actual length of one complete orbit of the Earth around the sun is closer to 365.256 days (1 sidereal year).
The Gregorian calendar has, on average, 365.2425 days.
While not entirely accurate, 365.25 is the value used in this exercise.
See [Year on Wikipedia][year] for more ways to measure a year.

[pluto-video]: https://www.youtube.com/watch?v=Z_2gbGXzFbs
[year]: https://en.wikipedia.org/wiki/Year#Summary

For the Python track, this exercise asks you to create a `SpaceAge` _class_ (_[concept:python/classes]()_) that includes methods for all the planets of the solar system.
Methods should follow the naming convention `on_<planet name>`.

Each method should `return` the age (_"on" that planet_) in years, rounded to two decimal places:

```python
#creating an instance with one billion seconds, and calling .on_earth().
>>> SpaceAge(1000000000).on_earth()

#This is one billion seconds on Earth in years
31.69
```

For more information on constructing and using classes, see:

-   [**A First Look at Classes**][first look at classes] from the Python documentation.
-   [**A Word About names and Objects**][names and objects] from the Python documentation.
-   [**Objects, values, and types**][objects, values and types] in the Python data model documentation.
-   [**What is a Class?**][what is a class] from Trey Hunners Python Morsels website.

[first look at classes]: https://docs.python.org/3/tutorial/classes.html#a-first-look-at-classes
[names and objects]: https://docs.python.org/3/tutorial/classes.html#a-word-about-names-and-objects
[objects, values and types]: https://docs.python.org/3/reference/datamodel.html#objects-values-and-types
[what is a class]: https://www.pythonmorsels.com/what-is-a-class/

## Source

### Contributed to by

- @abhijitparida
- @behrtam
- @cmccandless
- @crsmi
- @Dog
- @gabriel376
- @gabriellhrn
- @ikhadykin
- @kytrinyx
- @lowks
- @N-Parsons
- @pheanex
- @sjakobi
- @tqa236
- @AndrewLawendy

### Based on

Partially inspired by Chapter 1 in Chris Pine's online Learn to Program tutorial. - https://pine.fm/LearnToProgram/?Chapter=01
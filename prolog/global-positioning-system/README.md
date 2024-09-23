# Global Positioning System

Welcome to Global Positioning System on Exercism's Prolog Track.
If you need help running the tests or submitting your code, check out `HELP.md`.
If you get stuck on the exercise, check out `HINTS.md`, but try and solve it without using those first :)

## Introduction

You're a huge fan of [geocaching](https://en.wikipedia.org/wiki/Geocaching), which combines your love for the outdoors with a love for solving puzzles.
Whilst the local geocaching website lists the GPS coordinates of all caches, it does _not_ support creating an efficient route for gathering them.
It so happens you have pathfinding software installed on your machine, but it uses a different GPS format from the geocaching website.
To feed the data into the pathfinding software, you'll need to parse the degrees and hemisphere for both the latitude and longitude of each GPS coordinate on the website.

## Instructions

Your task is to parse GPS coordinates.
Each coordinate is formatted using the [Decimal Degrees format](https://en.wikipedia.org/wiki/Decimal_degrees) variant with explicit hemispheres:

```text
<LATITUDE_DEGREES> <LATITUDE_HEMISPHERE>, <LONGITUDE_DEGREES> <LONGITUDE_HEMISPHERE>
```

These are the allowed values for each individual component:

- `<LATITUDE_DEGREES>`: a floating-point number in the range 0..90 (inclusive)
- `<LATITUDE_HEMISPHERE>`: either `N` or `S`
- `<LONGITUDE_DEGREES>`: a floating-point number in the range 0..180 (inclusive)
- `<LONGITUDE_HEMISPHERE>`: either `E` or `W`

For example, `"48.8584 N 2.2945 E"` parses into:

- `<LATITUDE_DEGREES>`: 48.8584
- `<LATITUDE_HEMISPHERE>`: N
- `<LONGITUDE_DEGREES>`: 2.2945
- `<LONGITUDE_HEMISPHERE>`: E

You have 11 tasks, in which you'll incrementally parse GPS coordinates.
You'll be using Prolog's [Definite Clause Grammar](https://en.wikipedia.org/wiki/Definite_clause_grammar) (DCG) support, which are designed to parse structured text.

````exercism/note
To help you get started, the stub file already includes the [`dcg/basics` library](https://www.swi-prolog.org/pldoc/doc/_SWI_/library/dcg/basics.pl) via:

```prolog
:- use_module(library(dcg/basics)).
```
````

## 1. Parse a comma

Implement the `comma` rule to parse a single comma (`","`):

```prolog
?- string_codes(",", Codes), phrase(comma, Codes).
```

## 2. Parse a space

Implement the `space` rule to parse a single space (`" "`):

```prolog
?- string_codes(" ", Codes), phrase(space, Codes).
```

## 3. Support all whitespace (except newlines)

Modify the `space` rule to parse _all_ whitespace, except for newlines:

```prolog
?- string_codes("\t", Codes), phrase(space, Codes).

?- string_codes("\n", Codes), phrase(space, Codes).
false.
```

## 4. Parse the latitude's hemisphere

The hemisphere of the latitude can be either `"N"` or `"S"`, which should be parsed to the `north` or `south` atom.
Implement the `latitude_hemisphere` rule to parse the latitude's hemisphere:

```prolog
?- string_codes("N", Codes), phrase(latitude_hemisphere(Hemisphere), Codes).
Hemisphere = north.
```

## 5. Parse the longitude's hemisphere

The hemisphere of the longitude can be either `"E"` or `"W"`, which should be parsed to the `east` or `west` atom.
Implement the `longitude_hemisphere` rule to parse the longitude's hemisphere:

```prolog
?- string_codes("E", Codes), phrase(longitude_hemisphere(Hemisphere), Codes).
Hemisphere = east.
```

## 6. Parse degrees

The degrees of a longitude or latitude ire defined as a floating-point number.
Implement the `degrees` rule to parse floating-point numbers:

```prolog
?- string_codes("748.012", Codes), phrase(degrees(Degrees), Codes).
Degrees = 748.012.
```

## 7. Parse latitude degrees

Latitude degrees are not just floating-point numbers, but floating-point numbers in the range 0..90 (inclusive).
Implement the `latitude_degrees` rule to parse latitude degrees using the above range:

```prolog
?- string_codes("48.745", Codes), phrase(latitude_degrees(Degrees), Codes).
Degrees = 48.745.

?- string_codes("117.844", Codes), phrase(latitude_degrees(Degrees), Codes).
false.
```

## 8. Parse longitude degrees

Longitude degrees are not just floating-point numbers, but floating-point numbers in the range 0..180 (inclusive).
Implement the `longitude_degrees` rule to parse longitude degrees using the above range:

```prolog
?- string_codes("178.773", Codes), phrase(longitude_degrees(Degrees), Codes).
Degrees = 178.773.

?- string_codes("-22.523", Codes), phrase(longitude_degrees(Degrees), Codes).
false.
```

## 9. Parse latitude

Latitudes have two parts: their degrees and hemisphere, which are separated by a space.
Implement the `latitude` rule to parse a latitude:

```prolog
?- string_codes("56.101 N", Codes), phrase(latitude(Degrees, Hemisphere), Codes).
Degrees = 56.101,
Hemisphere = north.
```

## 10. Parse longitude

Latitudes have two parts: their degrees and hemisphere, which are separated by a space.
Implement the `latitude` rule to parse a latitude:

```prolog
?- string_codes("143.889 W", Codes), phrase(longitude(Degrees, Hemisphere), Codes).
Degrees = 143.889,
Hemisphere = west.
```

## 11. Parse coordinate

Coordinates have two parts: their latitude and longitude, which are separated by a comma followed by a space.
Implement the `coordinate` rule to parse both the latitude (degrees and hemisphere):

```prolog
?- string_codes("48.8584 N, 2.2945 E", Codes), phrase(coordinate(Latitude, LatitudeHemisphere, Longitude, LongitudeHemisphere), Codes).
Latitude = 48.8584,
LatitudeHemisphere = north,
Longitude = 2.2945,
LongitudeHemisphere = east.
```

## Source

### Created by

- @erikschierboom
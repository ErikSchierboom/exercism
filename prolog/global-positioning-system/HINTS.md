# Hints

## General

- [Wikipedia's Definite Clause Grammar page](https://en.wikipedia.org/wiki/Definite_clause_grammar) gives a great overview of DCGs
- The [Prolog DCG Primer](https://www.metalevel.at/prolog/dcg) has a very useful introduction to Prolog DCGs
- The [SWIPL dcg/basics docs](https://www.swi-prolog.org/pldoc/doc/_SWI_/library/dcg/basics.pl) lists the built-in primitives you can use

## 3. Support all whitespace (except newlines)

- There is a [built-in primitive](https://www.swi-prolog.org/pldoc/doc/_SWI_/library/dcg/basics.pl) you can use for this

## 4. Parse the latitude's hemisphere

- DCG rules can have variables like regular facts or rules
- DCG rules can have multiple declarations like regular facts or rules

## 5. Parse the longitude's hemisphere

- DCG rules can have variables like regular facts or rules
- DCG rules can have multiple declarations like regular facts or rules

## 6. Parse degrees

- There is a [built-in primitive](https://www.swi-prolog.org/pldoc/doc/_SWI_/library/dcg/basics.pl) you can use for this

## 7. Parse latitude degrees

- You can re-use the `degrees` rule
- The `{}//1` language construct can be used to invoke Prolog predicates from within a rule

## 9. Parse latitude

- The format for a latitude is: `<LATITUDE_DEGREES> <LATITUDE_HEMISPHERE>`
- Re-use the rules you've already implemented

## 10. Parse longitude

- The format for a longitude is: `<LONGITUDE_DEGREES> <LONGITUDE_HEMISPHERE>`
- Re-use the rules you've already implemented

## 11. Parse coordinate

- The format for a coordinate is: `<LATITUDE_DEGREES> <LATITUDE_HEMISPHERE>, <LONGITUDE_DEGREES> <LONGITUDE_HEMISPHERE>`
- Re-use the rules you've already implemented
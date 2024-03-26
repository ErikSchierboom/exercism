create_rational(Numerator, Denominator, Rational) :-
    (Denominator < 0 -> Multiplier = -1; Multiplier = 1),
    Gcd is gcd(Numerator, Denominator),
    ReducedNumerator is Numerator * Multiplier div Gcd,
    ReducedDenominator is Denominator * Multiplier div Gcd,
    Rational = rational(ReducedNumerator, ReducedDenominator).

add(rational(A1, B1), rational(A2, B2), Added) :-
    Numerator is A1 * B2 + A2 * B1,
    Denominator is B1 * B2,
    create_rational(Numerator, Denominator, Added).

sub(rational(A1, B1), rational(A2, B2), Subtracted) :-
    Numerator is A1 * B2 - A2 * B1,
    Denominator is B1 * B2,
    create_rational(Numerator, Denominator, Subtracted).

mul(rational(A1, B1), rational(A2, B2), Multiplied) :-
    Numerator is A1 * A2,
    Denominator is B1 * B2,
    create_rational(Numerator, Denominator, Multiplied).

div(rational(A1, B1), rational(A2, B2), Divided) :-
    Numerator is A1 * B2,
    Denominator is A2 * B1,
    create_rational(Numerator, Denominator, Divided).

abs(rational(A, B), Abs) :-
    Numerator is abs(A),
    Denominator is abs(B),
    create_rational(Numerator, Denominator, Abs).

pow(rational(A,B), Power, Raised) :-
    (Power < 0 ->
        Numerator is B ** (-Power),
        Denominator is A ** (-Power);
        Numerator is A ** Power,
        Denominator is B ** Power),
    create_rational(Numerator, Denominator, Raised), !.

pow(N, rational(A,B), Raised) :-
    Raised is N ** (A / B).

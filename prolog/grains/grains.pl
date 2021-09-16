square(SquareNumber, Value) :- 
    between(1, 64, SquareNumber),
    Value is 2 ** (SquareNumber - 1).

total(Value) :- Value is 2 ** 64 - 1.

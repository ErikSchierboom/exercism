leap(Year) :- (
    Year mod 400=:=0, !;
    Year mod 100=\=0, Year mod 4=:=0
).

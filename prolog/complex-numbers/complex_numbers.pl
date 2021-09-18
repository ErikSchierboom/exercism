real((R,_), R).
imaginary((_,I), I).

conjugate((R,I), (R, Ix)) :- Ix is 0-I.
abs((R, I), A) :- A is sqrt(R*R + I*I).

add((R1,I1),(R2, I2),(R3, I3)) :- R3 is R1 + R2, I3 is I1 + I2.
sub((R1,I1),(R2, I2),(R3, I3)) :- R3 is R1 - R2, I3 is I1 - I2.

mul((R1,I1),(R2, I2),(R3, I3)) :- R3 is R1 * R2 - I1 * I2, I3 is I1 * R2 + R1 * I2.
div((R1,I1),(R2, I2),(R3, I3)) :- 
    conjugate((R2, I2), C2),
    mul((R1,I1), C2, (NR,NI)),
    mul((R2,I2), C2, (DR,_)),
    R3 is NR / DR,
    I3 is NI / DR.

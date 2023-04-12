sound(Factor, N, Sound, Sounds) :-
    (N mod Factor =:= 0 -> Sounds = Sound ; Sounds = "").

convert(N, Sounds) :-
    sound(3, N, "Pling", S1),
    sound(5, N, "Plang", S2),
    sound(7, N, "Plong", S3),
    string_concat(S1, S2, R1),
    string_concat(R1, S3, R2),
    (R2 = "" -> number_string(N, Sounds) ; Sounds = R2).

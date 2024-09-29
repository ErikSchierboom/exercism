convert(N, Raindrops) :-
    findall(Sound, (sound(M, Sound), N mod M =:= 0), Sounds),
    (Sounds == [] 
        -> number_string(N, Raindrops)
         ; atomic_list_concat(Sounds, "", Atom), atom_string(Atom, Raindrops)).

sound(3, "Pling").
sound(5, "Plang").
sound(7, "Plong").

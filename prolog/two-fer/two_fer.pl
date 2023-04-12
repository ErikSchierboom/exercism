two_fer(Name, Dialogue) :-
    string_concat("One for ", Name, Recipient),
    string_concat(Recipient, ", one for me.", Dialogue).

two_fer(Dialogue) :- two_fer("you", Dialogue).

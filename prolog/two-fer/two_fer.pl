two_fer(Dialogue) :- two_fer("you", Dialogue).
two_fer(Name, Dialogue) :- format(string(Dialogue), "One for ~s, one for me.", [Name]).

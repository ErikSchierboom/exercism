words(Sentence, Words) :-
    split_string(Sentence, " ", "", W0),
    maplist([Word,Acc]>>(split_string(Word,"-", "",Acc)), W0, W1),
    flatten(W1, W2),
    maplist(string_upper, W2, W3),
    delete(W3, "", Words).

abbreviate_word(Word, Letter) :-
    string_chars(Word, Letters),
    delete(Letters, '_', [Letter|_]).

abbreviate(Sentence, Acromym) :-
    words(Sentence, Words),
    maplist(abbreviate_word, Words, Letters),
    string_chars(Acromym, Letters).

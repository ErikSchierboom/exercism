pending :-
    current_prolog_flag(argv, ['--all'|_]).
pending :-
    write('\nA TEST IS PENDING!\n'),
    fail.

:- begin_tests(twelve_days).

test(first_day_a_partridge_in_a_pear_tree, condition(true)) :-
    recite(1, Lyrics),
    Lyrics == [
        "On the first day of Christmas my true love gave to me: a Partridge in a Pear Tree."
    ].

test(second_day_two_turtle_doves, condition(pending)) :-
    recite(2, Lyrics),
    Lyrics == [
        "On the second day of Christmas my true love gave to me: two Turtle Doves, and a Partridge in a Pear Tree."
    ].

test(third_day_three_french_hens, condition(pending)) :-
    recite(3, Lyrics),
    Lyrics == [
        "On the third day of Christmas my true love gave to me: three French Hens, two Turtle Doves, and a Partridge in a Pear Tree."
    ].

test(fourth_day_four_calling_birds, condition(pending)) :-
    recite(4, Lyrics),
    Lyrics == [
        "On the fourth day of Christmas my true love gave to me: four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree."
    ].

test(fifth_day_five_gold_rings, condition(pending)) :-
    recite(5, Lyrics),
    Lyrics == [
        "On the fifth day of Christmas my true love gave to me: five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree."
    ].

test(sixth_day_six_geese_a_laying, condition(pending)) :-
    recite(6, Lyrics),
    Lyrics == [
        "On the sixth day of Christmas my true love gave to me: six Geese-a-Laying, five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree."
    ].

test(seventh_day_seven_swans_a_swimming, condition(pending)) :-
    recite(7, Lyrics),
    Lyrics == [
        "On the seventh day of Christmas my true love gave to me: seven Swans-a-Swimming, six Geese-a-Laying, five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree."
    ].

test(eighth_day_eight_maids_a_milking, condition(pending)) :-
    recite(8, Lyrics),
    Lyrics == [
        "On the eighth day of Christmas my true love gave to me: eight Maids-a-Milking, seven Swans-a-Swimming, six Geese-a-Laying, five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree."
    ].

test(ninth_day_nine_ladies_dancing, condition(pending)) :-
    recite(9, Lyrics),
    Lyrics == [
        "On the ninth day of Christmas my true love gave to me: nine Ladies Dancing, eight Maids-a-Milking, seven Swans-a-Swimming, six Geese-a-Laying, five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree."
    ].

test(tenth_day_ten_lords_a_leaping, condition(pending)) :-
    recite(10, Lyrics),
    Lyrics == [
        "On the tenth day of Christmas my true love gave to me: ten Lords-a-Leaping, nine Ladies Dancing, eight Maids-a-Milking, seven Swans-a-Swimming, six Geese-a-Laying, five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree."
    ].

test(eleventh_day_eleven_pipers_piping, condition(pending)) :-
    recite(11, Lyrics),
    Lyrics == [
        "On the eleventh day of Christmas my true love gave to me: eleven Pipers Piping, ten Lords-a-Leaping, nine Ladies Dancing, eight Maids-a-Milking, seven Swans-a-Swimming, six Geese-a-Laying, five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree."
    ].

test(twelfth_day_twelve_drummers_drumming, condition(pending)) :-
    recite(12, Lyrics),
    Lyrics == [
        "On the twelfth day of Christmas my true love gave to me: twelve Drummers Drumming, eleven Pipers Piping, ten Lords-a-Leaping, nine Ladies Dancing, eight Maids-a-Milking, seven Swans-a-Swimming, six Geese-a-Laying, five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree."
    ].

test(recites_first_three_verses_of_the_song, condition(pending)) :-
    recite(1, 3, Lyrics),
    Lyrics == [
        "On the first day of Christmas my true love gave to me: a Partridge in a Pear Tree.",
        "On the second day of Christmas my true love gave to me: two Turtle Doves, and a Partridge in a Pear Tree.",
        "On the third day of Christmas my true love gave to me: three French Hens, two Turtle Doves, and a Partridge in a Pear Tree."
    ].

test(recites_three_verses_from_the_middle_of_the_song, condition(pending)) :-
    recite(4, 6, Lyrics),
    Lyrics == [
        "On the fourth day of Christmas my true love gave to me: four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree.",
        "On the fifth day of Christmas my true love gave to me: five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree.",
        "On the sixth day of Christmas my true love gave to me: six Geese-a-Laying, five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree."
    ].

test(recites_the_whole_song, condition(pending)) :-
    recite(1, 12, Lyrics),
    Lyrics == [
        "On the first day of Christmas my true love gave to me: a Partridge in a Pear Tree.",
        "On the second day of Christmas my true love gave to me: two Turtle Doves, and a Partridge in a Pear Tree.",
        "On the third day of Christmas my true love gave to me: three French Hens, two Turtle Doves, and a Partridge in a Pear Tree.",
        "On the fourth day of Christmas my true love gave to me: four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree.",
        "On the fifth day of Christmas my true love gave to me: five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree.",
        "On the sixth day of Christmas my true love gave to me: six Geese-a-Laying, five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree.",
        "On the seventh day of Christmas my true love gave to me: seven Swans-a-Swimming, six Geese-a-Laying, five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree.",
        "On the eighth day of Christmas my true love gave to me: eight Maids-a-Milking, seven Swans-a-Swimming, six Geese-a-Laying, five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree.",
        "On the ninth day of Christmas my true love gave to me: nine Ladies Dancing, eight Maids-a-Milking, seven Swans-a-Swimming, six Geese-a-Laying, five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree.",
        "On the tenth day of Christmas my true love gave to me: ten Lords-a-Leaping, nine Ladies Dancing, eight Maids-a-Milking, seven Swans-a-Swimming, six Geese-a-Laying, five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree.",
        "On the eleventh day of Christmas my true love gave to me: eleven Pipers Piping, ten Lords-a-Leaping, nine Ladies Dancing, eight Maids-a-Milking, seven Swans-a-Swimming, six Geese-a-Laying, five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree.",
        "On the twelfth day of Christmas my true love gave to me: twelve Drummers Drumming, eleven Pipers Piping, ten Lords-a-Leaping, nine Ladies Dancing, eight Maids-a-Milking, seven Swans-a-Swimming, six Geese-a-Laying, five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, and a Partridge in a Pear Tree."
    ].

:- end_tests(twelve_days).

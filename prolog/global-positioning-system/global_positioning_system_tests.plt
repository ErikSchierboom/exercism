pending :-
    current_prolog_flag(argv, ['--all'|_]).
pending :-
    write('\nA TEST IS PENDING!\n'),
    fail.

:- begin_tests(global_positioning_system).

    test(comma_parses_comma, condition(true)) :-
        string_codes(",", Codes),
        phrase(comma, Codes).

    test(comma_does_not_parse_semicolon, [fail, condition(true)]) :-
        string_codes(";", Codes),
        phrase(comma, Codes).

    test(space_parse_space, condition(true)) :-
        string_codes(" ", Codes),
        phrase(space, Codes).

    test(space_parses_tab, condition(true)) :-
        string_codes("\t", Codes),
        phrase(space, Codes).

    test(space_does_not_parse_newline, [fail, condition(true)]) :-
        string_codes("\n", Codes),
        phrase(space, Codes).

    test(latitude_hemisphere_parses_north_hemisphere, condition(true)) :-
        string_codes("N", Codes),
        phrase(latitude_hemisphere(Hemisphere), Codes),
        Hemisphere == north.

    test(latitude_hemisphere_parses_south_hemisphere, condition(true)) :-
        string_codes("S", Codes),
        phrase(latitude_hemisphere(Hemisphere), Codes),
        Hemisphere == south.

    test(latitude_hemisphere_only_parses_north_and_south_hemispheres, condition(true)) :-
        findall(Hemisphere, phrase(latitude_hemisphere(Hemisphere), _), Hemispheres),
        Hemispheres == [north, south].

    test(longitude_hemisphere_parses_east_hemisphere, condition(true)) :-
        string_codes("E", Codes),
        phrase(longitude_hemisphere(Hemisphere), Codes),
        Hemisphere == east.

    test(longitude_hemisphere_parses_west_hemisphere, condition(true)) :-
        string_codes("W", Codes),
        phrase(longitude_hemisphere(Hemisphere), Codes),
        Hemisphere == west.

    test(longitude_hemisphere_only_parses_east_and_west_hemispheres, condition(true)) :-
        findall(Hemisphere, phrase(longitude_hemisphere(Hemisphere), _), Hemispheres),
        Hemispheres == [east, west].

    test(degrees_parses_positive_float, condition(true)) :-
        string_codes("748.012", Codes),
        phrase(degrees(Degrees), Codes),
        Degrees =:= 748.012.

    test(degrees_parses_negative_float, condition(true)) :-
        string_codes("-23.456", Codes),
        phrase(degrees(Degrees), Codes),
        Degrees =:= -23.456.

    test(latitude_degrees_does_not_parse_negative_degrees, [fail, condition(true)]) :-
        string_codes("-1.234", Codes),
        phrase(latitude_degrees(_), Codes).

    test(latitude_degrees_does_not_parse_degrees_greater_than_90, [fail, condition(true)]) :-
        string_codes("93.488", Codes),
        phrase(latitude_degrees(_), Codes).

    test(latitude_degrees_parses_degrees_between_0_and_90, condition(true)) :-
        between(0, 90, IntDegrees),
        Degrees is float(IntDegrees),
        number_string(Degrees, String),
        string_codes(String, Codes),
        phrase(latitude_degrees(LatitudeDegrees), Codes),
        LatitudeDegrees =:= Degrees,
        !.

    test(longitude_degrees_does_not_parse_negative_degrees, [fail, condition(true)]) :-
        string_codes("-1.234", Codes),
        phrase(longitude_degrees(_), Codes).

    test(longitude_degrees_does_not_parse_degrees_greater_than_180, [fail, condition(true)]) :-
        string_codes("181.765", Codes),
        phrase(longitude_degrees(_), Codes).

    test(longitude_degrees_parses_degrees_between_0_and_180, condition(true)) :-
        between(0, 180, IntDegrees),
        Degrees is float(IntDegrees),
        number_string(Degrees, String),
        string_codes(String, Codes),
        phrase(longitude_degrees(LongitudeDegrees), Codes),
        LongitudeDegrees =:= Degrees,
        !.

    test(latitude_parses_degrees, condition(true)) :-
        string_codes("56.101 N", Codes),
        phrase(latitude(Degrees, _), Codes),
        Degrees =:= 56.101.

    test(latitude_parses_hemisphere, condition(true)) :-
        string_codes("56.101 N", Codes),
        phrase(latitude(_, Hemisphere), Codes),
        Hemisphere == north.

    test(latitude_does_not_parse_with_missing_space_separator, [fail, condition(true)]) :-
        string_codes("56.101N", Codes),
        phrase(latitude(_, _), Codes).

    test(latitude_does_not_parse_with_missing_degrees, [fail, condition(true)]) :-
        string_codes("N", Codes),
        phrase(latitude(_, _), Codes).

    test(latitude_does_not_parse_with_missing_hemisphere, [fail, condition(true)]) :-
        string_codes("56.101", Codes),
        phrase(latitude(_, _), Codes).

    test(longitude_parses_degrees, condition(true)) :-
        string_codes("143.889 W", Codes),
        phrase(longitude(Degrees, _), Codes),
        Degrees =:= 143.889.

    test(longitude_parses_hemisphere, condition(true)) :-
        string_codes("143.889 W", Codes),
        phrase(longitude(_, Hemisphere), Codes),
        Hemisphere == west.

    test(longitude_does_not_parse_with_missing_space_separator, [fail, condition(true)]) :-
        string_codes("143.889W", Codes),
        phrase(longitude(_, _), Codes).

    test(longitude_does_not_parse_with_missing_degrees, [fail, condition(true)]) :-
        string_codes("W", Codes),
        phrase(longitude(_, _), Codes).

    test(longitude_does_not_parse_with_missing_hemisphere, [fail, condition(true)]) :-
        string_codes("143.889", Codes),
        phrase(longitude(_, _), Codes).

    test(coordinate_parses_coordinate, [fail, condition(true)]) :-
        string_codes("48.8584 N 2.2945 E", Codes),
        phrase(coordinate(Latitude, LatitudeHemisphere, Longitude, LongitudeHemisphere), Codes),
        Latitude =:= 48.8584,
        LatitudeHemisphere == north,
        Longitude =:= 2.2945,
        LongitudeHemisphere == east.

    test(coordinate_does_not_parse_with_missing_comma_and_space_separator, [fail, condition(true)]) :-
        string_codes("48.8584 N 2.2945 E", Codes),
        phrase(coordinate(_, _, _, _), Codes).

    test(coordinate_does_not_parse_with_missing_latitude, [fail, condition(true)]) :-
        string_codes("2.2945 E", Codes),
        phrase(coordinate(_, _, _, _), Codes).

    test(coordinate_does_not_parse_with_missing_longitude, [fail, condition(true)]) :-
        string_codes("48.8584 N", Codes),
        phrase(coordinate(_, _, _, _), Codes).

:- end_tests(global_positioning_system).

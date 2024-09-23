:- use_module(library(dcg/basics)).

comma --> ",".
space --> white.

latitude_hemisphere(north) --> "N".
latitude_hemisphere(south) --> "S".

longitude_hemisphere(east) --> "E".
longitude_hemisphere(west) --> "W".

degrees(Degrees) --> float(Degrees).
latitude_degrees(Degrees) --> degrees(Degrees), { Degrees >= 0, Degrees =< 90 }.
longitude_degrees(Degrees) --> degrees(Degrees), { Degrees >= 0, Degrees =< 180 }.

latitude(Degrees, Hemisphere) --> latitude_degrees(Degrees), space, latitude_hemisphere(Hemisphere).
longitude(Degrees, Hemisphere) --> longitude_degrees(Degrees), space, longitude_hemisphere(Hemisphere).

coordinate(Latitude, LatitudeHemisphere, Longitude, LongitudeHemisphere) -->
    latitude(Latitude, LatitudeHemisphere), comma, space, longitude(Longitude, LongitudeHemisphere).

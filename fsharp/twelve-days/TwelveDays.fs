module TwelveDays

let private numberToStr = 
    function
    | 0  -> "a"
    | 1  -> "and a"
    | 2  -> "two"
    | 3  -> "three"
    | 4  -> "four"
    | 5  -> "five"
    | 6  -> "six"
    | 7  -> "seven"
    | 8  -> "eight"
    | 9  -> "nine"
    | 10 -> "ten"
    | 11 -> "eleven"
    | 12 -> "twelve"
    | _  -> failwith "Invalid day"

let private countToStr = 
    function
    | 1  -> "first"
    | 2  -> "second"
    | 3  -> "third"
    | 4  -> "fourth"
    | 5  -> "fifth"
    | 6  -> "sixth"
    | 7  -> "seventh"
    | 8  -> "eighth"
    | 9  -> "ninth"
    | 10  -> "tenth"
    | 11 -> "eleventh"
    | 12 -> "twelfth"
    | _  -> failwith "Invalid count"

let private subject = 
    function
    | 0  -> "Partridge in a Pear Tree";
    | 1  -> "Partridge in a Pear Tree";
    | 2  -> "Turtle Doves"; 
    | 3  -> "French Hens"; 
    | 4  -> "Calling Birds"; 
    | 5  -> "Gold Rings"; 
    | 6  -> "Geese-a-Laying"; 
    | 7  -> "Swans-a-Swimming";
    | 8  -> "Maids-a-Milking";
    | 9  -> "Ladies Dancing"; 
    | 10 -> "Lords-a-Leaping"; 
    | 11 -> "Pipers Piping";
    | 12 -> "Drummers Drumming"
    | _  -> failwith "Invalid subject"

let private subjectToStr number = $"%s{numberToStr number} %s{subject number}"

let private verseBegin number = $"On the %s{countToStr number} day of Christmas my true love gave to me, "

let private verseEnd = 
    function
    | 1 -> 
        subjectToStr 0
    | number -> 
        [number .. -1 .. 1] 
        |> List.map subjectToStr 
        |> List.reduce (fun x y -> x + ", " + y)

let private verse number = $"%s{verseBegin number}%s{verseEnd number}."

let recite start stop = List.map verse [start..stop]
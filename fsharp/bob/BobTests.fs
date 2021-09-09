module BobTests

open FsUnit.Xunit
open Xunit

open Bob

[<Fact>]
let ``Stating something`` () =
    response "Tom-ay-to, tom-aaaah-to." |> should equal "Whatever."

[<Fact>]
let ``Shouting`` () =
    response "WATCH OUT!" |> should equal "Whoa, chill out!"

[<Fact>]
let ``Shouting gibberish`` () =
    response "FCECDFCAAB" |> should equal "Whoa, chill out!"

[<Fact>]
let ``Asking a question`` () =
    response "Does this cryogenic chamber make me look fat?" |> should equal "Sure."

[<Fact>]
let ``Asking a numeric question`` () =
    response "You are, what, like 15?" |> should equal "Sure."

[<Fact>]
let ``Asking gibberish`` () =
    response "fffbbcbeab?" |> should equal "Sure."

[<Fact>]
let ``Talking forcefully`` () =
    response "Hi there!" |> should equal "Whatever."

[<Fact>]
let ``Using acronyms in regular speech`` () =
    response "It's OK if you don't want to go work for NASA." |> should equal "Whatever."

[<Fact>]
let ``Forceful question`` () =
    response "WHAT'S GOING ON?" |> should equal "Calm down, I know what I'm doing!"

[<Fact>]
let ``Shouting numbers`` () =
    response "1, 2, 3 GO!" |> should equal "Whoa, chill out!"

[<Fact>]
let ``No letters`` () =
    response "1, 2, 3" |> should equal "Whatever."

[<Fact>]
let ``Question with no letters`` () =
    response "4?" |> should equal "Sure."

[<Fact>]
let ``Shouting with special characters`` () =
    response "ZOMG THE %^*@#$(*^ ZOMBIES ARE COMING!!11!!1!" |> should equal "Whoa, chill out!"

[<Fact>]
let ``Shouting with no exclamation mark`` () =
    response "I HATE THE DENTIST" |> should equal "Whoa, chill out!"

[<Fact>]
let ``Statement containing question mark`` () =
    response "Ending with ? means a question." |> should equal "Whatever."

[<Fact>]
let ``Non-letters with question`` () =
    response ":) ?" |> should equal "Sure."

[<Fact>]
let ``Prattling on`` () =
    response "Wait! Hang on. Are you going to be OK?" |> should equal "Sure."

[<Fact>]
let ``Silence`` () =
    response "" |> should equal "Fine. Be that way!"

[<Fact>]
let ``Prolonged silence`` () =
    response "          " |> should equal "Fine. Be that way!"

[<Fact>]
let ``Alternate silence`` () =
    response "\t\t\t\t\t\t\t\t\t\t" |> should equal "Fine. Be that way!"

[<Fact>]
let ``Multiple line question`` () =
    response "\nDoes this cryogenic chamber make me look fat?\nNo." |> should equal "Whatever."

[<Fact>]
let ``Starting with whitespace`` () =
    response "         hmmmmmmm..." |> should equal "Whatever."

[<Fact>]
let ``Ending with whitespace`` () =
    response "Okay if like my  spacebar  quite a bit?   " |> should equal "Sure."

[<Fact>]
let ``Other whitespace`` () =
    response "\n\r \t" |> should equal "Fine. Be that way!"

[<Fact>]
let ``Non-question ending with whitespace`` () =
    response "This is a statement ending with whitespace      " |> should equal "Whatever."


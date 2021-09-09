module CryptoSquareTests

open FsUnit.Xunit
open Xunit

open CryptoSquare

[<Fact>]
let ``Empty plaintext results in an empty ciphertext`` () =
    ciphertext "" |> should equal ""

[<Fact>]
let ``Lowercase`` () =
    ciphertext "A" |> should equal "a"

[<Fact>]
let ``Remove spaces`` () =
    ciphertext "  b " |> should equal "b"

[<Fact>]
let ``Remove punctuation`` () =
    ciphertext "@1,%!" |> should equal "1"

[<Fact>]
let ``9 character plaintext results in 3 chunks of 3 characters`` () =
    ciphertext "This is fun!" |> should equal "tsf hiu isn"

[<Fact>]
let ``8 character plaintext results in 3 chunks, the last one with a trailing space`` () =
    ciphertext "Chill out." |> should equal "clu hlt io "

[<Fact>]
let ``54 character plaintext results in 7 chunks, the last two with trailing spaces`` () =
    ciphertext "If man was meant to stay on the ground, god would have given us roots." |> should equal "imtgdvs fearwer mayoogo anouuio ntnnlvt wttddes aohghn  sseoau "


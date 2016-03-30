module CryptoSquareTests

open NUnit.Framework
open CryptoSquare

[<Test>]
let ``Strange characters are stripped during normalization`` () =
    Assert.That(normalizePlaintext "s#$%^&plunk", Is.EqualTo("splunk"))

[<Test>]    
let ``Letters are lowercased during normalization`` () =
    Assert.That(normalizePlaintext "WHOA HEY!", Is.EqualTo("whoahey"))

[<Test>]    
let ``Numbers are kept during normalization`` () =
    Assert.That(normalizePlaintext "1, 2, 3, GO!", Is.EqualTo("123go"))

[<Test>]    
let ``Smallest square size is 2`` () =
    Assert.That(size "1234", Is.EqualTo(2))

[<Test>]    
let ``Size of text whose length is a perfect square is its square root`` () =
    Assert.That(size "123456789", Is.EqualTo(3))

[<Test>]    
let ``Size of text whose length is not a perfect square is next biggest square root`` () =
    Assert.That(size "123456789abc", Is.EqualTo(4))

[<Test>]    
let ``Size is determined by normalized text`` () =
    Assert.That(size "Oh hey, this is nuts!", Is.EqualTo(4))

[<Test>]    
let ``Segments are split by square size`` () =
    Assert.That(plaintextSegments "Never vex thine heart with idle woes", Is.EqualTo(["neverv"; "exthin"; "eheart"; "withid"; "lewoes"]))

[<Test>]    
let ``Segments are split by square size until text runs out`` () =
    Assert.That(plaintextSegments "ZOMG! ZOMBIES!!!", Is.EqualTo(["zomg"; "zomb"; "ies"]))

[<Test>]    
let ``Ciphertext combines text by column`` () =
    Assert.That(ciphertext "First, solve the problem. Then, write the code.", Is.EqualTo("foeewhilpmrervrticseohtottbeedshlnte"))

[<Test>]    
let ``Ciphertext skips cells with no text`` () =
    Assert.That(ciphertext "Time is an illusion. Lunchtime doubly so.", Is.EqualTo("tasneyinicdsmiohooelntuillibsuuml"))

[<Test>]    
let ``Normalized ciphertext is split by 5`` () =
    Assert.That(normalizeCiphertext "Vampires are people too!", Is.EqualTo("vrel aepe mset paoo irpo"))

[<Test>]    
let ``Normalized ciphertext not exactly divisible by 5 spills into a smaller segment`` () =
    Assert.That(normalizeCiphertext "Madness, and then illumination.", Is.EqualTo("msemo aanin dnin ndla etlt shui"))
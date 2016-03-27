module BobTests

open NUnit.Framework
open Bob
    
[<Test>]
let ``Stating something`` () =
    Assert.That(hey "Tom-ay-to, tom-aaaah-to.", Is.EqualTo("Whatever."))

[<Test>]
let ``Shouting`` () =
    Assert.That(hey "WATCH OUT!", Is.EqualTo("Whoa, chill out!"))

[<Test>]
let ``Asking a question`` () =
    Assert.That(hey "Does this cryogenic chamber make me look fat?", Is.EqualTo("Sure."))

[<Test>]
let ``Asking a numeric question`` () =
    Assert.That(hey "You are, what, like 15?", Is.EqualTo("Sure."))

[<Test>]
let ``Forceful questions`` () =
    Assert.That(hey "WHAT THE HELL WERE YOU THINKING?", Is.EqualTo("Whoa, chill out!"))

[<Test>]
let ``Shouting numbers`` () =
    Assert.That(hey "1, 2, 3 GO!", Is.EqualTo("Whoa, chill out!"))

[<Test>]
let ``Only numbers`` () =
    Assert.That(hey "1, 2, 3", Is.EqualTo("Whatever."))

[<Test>]
let ``Question only with numbers`` () =
    Assert.That(hey "4?", Is.EqualTo("Sure."))

[<Test>]
let ``Shouting with special characters`` () =
    Assert.That(hey "ZOMG THE %^*@#$(*^ ZOMBIES ARE COMING!!11!!1!", Is.EqualTo("Whoa, chill out!"))

[<Test>]
let ``Shouting with no exlamation mark`` () =
    Assert.That(hey "I HATE YOU", Is.EqualTo("Whoa, chill out!"))

[<Test>]
let ``Statement containing question mark`` () =
    Assert.That(hey "Ending with ? means a question.", Is.EqualTo("Whatever."))

[<Test>]
let ``Prattling on`` () =
    Assert.That(hey "Wait! Hang on. Are you going to be OK?", Is.EqualTo("Sure."))

[<Test>]
let ``Silence`` () =
    Assert.That(hey "", Is.EqualTo("Fine. Be that way!"))

[<Test>]
let ``Prolonged silence`` () =
    Assert.That(hey "    ", Is.EqualTo("Fine. Be that way!"))

[<Test>]
let ``Multiple line question`` () =
    Assert.That(hey "Does this cryogenic chamber make me look fat?\nno", Is.EqualTo("Whatever."))

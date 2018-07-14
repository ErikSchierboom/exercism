module RunLengthEncodingTest

open NUnit.Framework

open RunLengthEncoding

[<Test>]
let ``Encode simple`` () =
    let input = "AABBBCCCC"
    let expected = "2A3B4C"
    Assert.That(encode input, Is.EqualTo(expected))

[<Test>]
let ``Decode simple`` () =
    let input = "2A3B4C"
    let expected = "AABBBCCCC"
    Assert.That(decode input, Is.EqualTo(expected))

[<Test>]
let ``Encode with single values`` () =
    let input = "WWWWWWWWWWWWBWWWWWWWWWWWWBBBWWWWWWWWWWWWWWWWWWWWWWWWB"
    let expected = "12WB12W3B24WB"
    Assert.That(encode input, Is.EqualTo(expected))

[<Test>]
let ``Decode with single values`` () =
    let input = "12WB12W3B24WB"
    let expected = "WWWWWWWWWWWWBWWWWWWWWWWWWBBBWWWWWWWWWWWWWWWWWWWWWWWWB"
    Assert.That(decode input, Is.EqualTo(expected))

[<Test>]
let ``Encode and then decode`` () =
    let input = "zzz ZZ  zZ"
    let expected = "zzz ZZ  zZ"
    Assert.That(encode input |> decode, Is.EqualTo(expected))

[<Test>]
let ``Encode unicode`` () =
    let input = "⏰⚽⚽⚽⭐⭐⏰"
    let expected = "⏰3⚽2⭐⏰"
    Assert.That(encode input, Is.EqualTo(expected))

[<Test>]
let ``Decode unicode`` () =
    let input = "⏰3⚽2⭐⏰"
    let expected = "⏰⚽⚽⚽⭐⭐⏰"
    Assert.That(decode input, Is.EqualTo(expected))
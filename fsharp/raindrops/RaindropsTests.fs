module RaindropsTests
    
open NUnit.Framework
open Raindrops

[<TestFixture>]
type RaindropsTests() =
    [<TestCase(1, Result = "1")>]
    [<TestCase(52, Result = "52", Ignore = true)>]
    [<TestCase(12121, Result = "12121", Ignore = true)>]
    member tests.Non_primes_pass_through(number) =
        Raindrops().convert(number)

    [<TestCase(3, Ignore = true)>]
    [<TestCase(6, Ignore = true)>]
    [<TestCase(9, Ignore = true)>]
    member tests.Numbers_containing_3_as_a_prime_factor_give_pling(number) =
        Assert.That(Raindrops().convert(number), Is.EqualTo("Pling"))

    [<TestCase(5, Ignore = true)>]
    [<TestCase(10, Ignore = true)>]
    [<TestCase(25, Ignore = true)>]
    member tests.Numbers_containing_5_as_a_prime_factor_give_plang(number) =
        Assert.That(Raindrops().convert(number), Is.EqualTo("Plang"))

    [<TestCase(7, Ignore = true)>]
    [<TestCase(14, Ignore = true)>]
    [<TestCase(49, Ignore = true)>]
    member tests.Numbers_containing_7_as_a_prime_factor_give_plong(number) =
        Assert.That(Raindrops().convert(number), Is.EqualTo("Plong"))

    [<TestCase(15, Result = "PlingPlang", Ignore = true)>]
    [<TestCase(21, Result = "PlingPlong", Ignore = true)>]
    [<TestCase(35, Result = "PlangPlong", Ignore = true)>]
    [<TestCase(105, Result = "PlingPlangPlong", Ignore = true)>]
    [<Ignore>]
    member tests.Numbers_containing_multiple_prime_factors_give_all_results_concatenated(number) =
        Raindrops().convert(number)
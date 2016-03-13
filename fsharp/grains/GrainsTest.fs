﻿module GrainsTest

open NUnit.Framework
open Grains


type GrainsTest() = 
    let grains = Grains()
    
    [<Test>]
    member tests.Test_square_1() = Assert.That(grains.square (1), Is.EqualTo(1I))
    
    [<Test>]
    member tests.Test_square_2() = Assert.That(grains.square (2), Is.EqualTo(2I))
    
    [<Test>]
    member tests.Test_square_3() = Assert.That(grains.square (3), Is.EqualTo(4I))
    
    [<Test>]
    member tests.Test_square_4() = Assert.That(grains.square (4), Is.EqualTo(8I))
    
    [<Test>]
    member tests.Test_square_16() = Assert.That(grains.square (16), Is.EqualTo(32768I))
    
    [<Test>]
    member tests.Test_square_32() = Assert.That(grains.square (32), Is.EqualTo(2147483648I))
    
    [<Test>]
    member tests.Test_square_64() = Assert.That(grains.square (64), Is.EqualTo(9223372036854775808I))
    
    [<Test>]
    member tests.Test_total_grains() = Assert.That(grains.total(), Is.EqualTo(18446744073709551615I))

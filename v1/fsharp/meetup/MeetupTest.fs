module MeetupTest

open System
open NUnit.Framework

open Meetup

[<TestCase(5, DayOfWeek.Monday, ExpectedResult = "2013-5-13")>]
[<TestCase(3, DayOfWeek.Tuesday, ExpectedResult = "2013-3-19")>]
[<TestCase(1, DayOfWeek.Wednesday, ExpectedResult = "2013-1-16")>]
[<TestCase(5, DayOfWeek.Thursday, ExpectedResult = "2013-5-16")>]
[<TestCase(4, DayOfWeek.Friday, ExpectedResult = "2013-4-19")>]
[<TestCase(2, DayOfWeek.Saturday, ExpectedResult = "2013-2-16")>]
[<TestCase(10, DayOfWeek.Sunday, ExpectedResult = "2013-10-13")>]
let ``Finds first teenth day of week in a month``(month: int) (dayOfWeek: DayOfWeek) =
    let day = meetupDay dayOfWeek Schedule.Teenth 2013 month
    day.ToString("yyyy-M-d")
    
[<TestCase(3, DayOfWeek.Monday, ExpectedResult = "2013-3-4")>]
[<TestCase(5, DayOfWeek.Tuesday, ExpectedResult = "2013-5-7")>]
[<TestCase(7, DayOfWeek.Wednesday, ExpectedResult = "2013-7-3")>]
[<TestCase(9, DayOfWeek.Thursday, ExpectedResult = "2013-9-5")>]
[<TestCase(11, DayOfWeek.Friday, ExpectedResult = "2013-11-1")>]
[<TestCase(1, DayOfWeek.Saturday, ExpectedResult = "2013-1-5")>]
[<TestCase(4, DayOfWeek.Sunday, ExpectedResult = "2013-4-7")>]
let ``Finds first day of week in a month``(month: int) (dayOfWeek: DayOfWeek) =
    let day = meetupDay dayOfWeek Schedule.First 2013 month
    day.ToString("yyyy-M-d")
    
[<TestCase(3, DayOfWeek.Monday, ExpectedResult = "2013-3-11")>]
[<TestCase(5, DayOfWeek.Tuesday, ExpectedResult = "2013-5-14")>]
[<TestCase(7, DayOfWeek.Wednesday, ExpectedResult = "2013-7-10")>]
[<TestCase(9, DayOfWeek.Thursday, ExpectedResult = "2013-9-12")>]
[<TestCase(12, DayOfWeek.Friday, ExpectedResult = "2013-12-13")>]
[<TestCase(2, DayOfWeek.Saturday, ExpectedResult = "2013-2-9")>]
[<TestCase(4, DayOfWeek.Sunday, ExpectedResult = "2013-4-14")>]
let ``Finds second day of week in a month``(month: int) (dayOfWeek: DayOfWeek) =
    let day = meetupDay dayOfWeek Schedule.Second 2013 month
    day.ToString("yyyy-M-d")
    
[<TestCase(3, DayOfWeek.Monday, ExpectedResult = "2013-3-18")>]
[<TestCase(5, DayOfWeek.Tuesday, ExpectedResult = "2013-5-21")>]
[<TestCase(7, DayOfWeek.Wednesday, ExpectedResult = "2013-7-17")>]
[<TestCase(9, DayOfWeek.Thursday, ExpectedResult = "2013-9-19")>]
[<TestCase(12, DayOfWeek.Friday, ExpectedResult = "2013-12-20")>]
[<TestCase(2, DayOfWeek.Saturday, ExpectedResult = "2013-2-16")>]
[<TestCase(4, DayOfWeek.Sunday, ExpectedResult = "2013-4-21")>]
let ``Finds third day of week in a month``(month: int) (dayOfWeek: DayOfWeek) =
    let day = meetupDay dayOfWeek Schedule.Third 2013 month
    day.ToString("yyyy-M-d")
    
[<TestCase(3, DayOfWeek.Monday, ExpectedResult = "2013-3-25")>]
[<TestCase(5, DayOfWeek.Tuesday, ExpectedResult = "2013-5-28")>]
[<TestCase(7, DayOfWeek.Wednesday, ExpectedResult = "2013-7-24")>]
[<TestCase(9, DayOfWeek.Thursday, ExpectedResult = "2013-9-26")>]
[<TestCase(12, DayOfWeek.Friday, ExpectedResult = "2013-12-27")>]
[<TestCase(2, DayOfWeek.Saturday, ExpectedResult = "2013-2-23")>]
[<TestCase(4, DayOfWeek.Sunday, ExpectedResult = "2013-4-28")>]
let ``Finds fourth day of week in a month``(month: int) (dayOfWeek: DayOfWeek) =
    let day = meetupDay dayOfWeek Schedule.Fourth 2013 month
    day.ToString("yyyy-M-d")
    
[<TestCase(3, DayOfWeek.Monday, ExpectedResult = "2013-3-25")>]
[<TestCase(5, DayOfWeek.Tuesday, ExpectedResult = "2013-5-28")>]
[<TestCase(7, DayOfWeek.Wednesday, ExpectedResult = "2013-7-31")>]
[<TestCase(9, DayOfWeek.Thursday, ExpectedResult = "2013-9-26")>]
[<TestCase(12, DayOfWeek.Friday, ExpectedResult = "2013-12-27")>]
[<TestCase(2, DayOfWeek.Saturday, ExpectedResult = "2013-2-23")>]
[<TestCase(3, DayOfWeek.Sunday, ExpectedResult = "2013-3-31")>]
let ``Finds last day of week in a month``(month: int) (dayOfWeek: DayOfWeek) =
    let day = meetupDay dayOfWeek Schedule.Last 2013 month
    day.ToString("yyyy-M-d")
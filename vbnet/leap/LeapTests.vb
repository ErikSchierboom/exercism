Imports Xunit

Public Class LeapTests
    <Fact>
    Public Sub Year_not_divisible_by_4_in_common_year()
        Assert.[False](Leap.IsLeapYear(2015))
    End Sub

    <Fact>
    Public Sub Year_divisible_by_2_not_divisible_by_4_in_common_year()
        Assert.[False](Leap.IsLeapYear(1970))
    End Sub

    <Fact>
    Public Sub Year_divisible_by_4_not_divisible_by_100_in_leap_year()
        Assert.[True](Leap.IsLeapYear(1996))
    End Sub

    <Fact>
    Public Sub Year_divisible_by_4_and_5_is_still_a_leap_year()
        Assert.[True](Leap.IsLeapYear(1960))
    End Sub

    <Fact>
    Public Sub Year_divisible_by_100_not_divisible_by_400_in_common_year()
        Assert.[False](Leap.IsLeapYear(2100))
    End Sub

    <Fact>
    Public Sub Year_divisible_by_100_but_not_by_3_is_still_not_a_leap_year()
        Assert.[False](Leap.IsLeapYear(1900))
    End Sub

    <Fact>
    Public Sub Year_divisible_by_400_in_leap_year()
        Assert.[True](Leap.IsLeapYear(2000))
    End Sub

    <Fact>
    Public Sub Year_divisible_by_400_but_not_by_125_is_still_a_leap_year()
        Assert.[True](Leap.IsLeapYear(2400))
    End Sub

    <Fact>
    Public Sub Year_divisible_by_200_not_divisible_by_400_in_common_year()
        Assert.[False](Leap.IsLeapYear(1800))
    End Sub
End Class
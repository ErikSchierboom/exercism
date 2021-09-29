Imports Xunit
Public Class ClockTests
    <Fact>
    Public Sub OnTheHour()
        Dim sut = New Clock(8, 0)
        Assert.Equal("08:00", sut.ToString())
    End Sub
    <Fact>
    Public Sub PastTheHour()
        Dim sut = New Clock(11, 9)
        Assert.Equal("11:09", sut.ToString())
    End Sub
    <Fact>
    Public Sub MidnightIsZeroHours()
        Dim sut = New Clock(24, 0)
        Assert.Equal("00:00", sut.ToString())
    End Sub
    <Fact>
    Public Sub HourRollsOver()
        Dim sut = New Clock(25, 0)
        Assert.Equal("01:00", sut.ToString())
    End Sub
    <Fact>
    Public Sub HourRollsOverContinuously()
        Dim sut = New Clock(100, 0)
        Assert.Equal("04:00", sut.ToString())
    End Sub
    <Fact>
    Public Sub SixtyMinutesIsNextHour()
        Dim sut = New Clock(1, 60)
        Assert.Equal("02:00", sut.ToString())
    End Sub
    <Fact>
    Public Sub MinutesRollOver()
        Dim sut = New Clock(0, 160)
        Assert.Equal("02:40", sut.ToString())
    End Sub
    <Fact>
    Public Sub MinutesRollOverContinuously()
        Dim sut = New Clock(0, 1723)
        Assert.Equal("04:43", sut.ToString())
    End Sub
    <Fact>
    Public Sub HourAndMinutesRollOver()
        Dim sut = New Clock(25, 160)
        Assert.Equal("03:40", sut.ToString())
    End Sub
    <Fact>
    Public Sub HourAndMinutesRollOverContinuously()
        Dim sut = New Clock(201, 3001)
        Assert.Equal("11:01", sut.ToString())
    End Sub
    <Fact>
    Public Sub HourAndMinutesRollOverToExactlyMidnight()
        Dim sut = New Clock(72, 8640)
        Assert.Equal("00:00", sut.ToString())
    End Sub
    <Fact>
    Public Sub NegativeHour()
        Dim sut = New Clock(-1, 15)
        Assert.Equal("23:15", sut.ToString())
    End Sub
    <Fact>
    Public Sub NegativeHourRollsOver()
        Dim sut = New Clock(-25, 0)
        Assert.Equal("23:00", sut.ToString())
    End Sub
    <Fact>
    Public Sub NegativeHourRollsOverContinuously()
        Dim sut = New Clock(-91, 0)
        Assert.Equal("05:00", sut.ToString())
    End Sub
    <Fact>
    Public Sub NegativeMinutes()
        Dim sut = New Clock(1, -40)
        Assert.Equal("00:20", sut.ToString())
    End Sub
    <Fact>
    Public Sub NegativeMinutesRollOver()
        Dim sut = New Clock(1, -160)
        Assert.Equal("22:20", sut.ToString())
    End Sub
    <Fact>
    Public Sub NegativeMinutesRollOverContinuously()
        Dim sut = New Clock(1, -4820)
        Assert.Equal("16:40", sut.ToString())
    End Sub
    <Fact>
    Public Sub NegativeSixtyMinutesIsPreviousHour()
        Dim sut = New Clock(2, -60)
        Assert.Equal("01:00", sut.ToString())
    End Sub
    <Fact>
    Public Sub NegativeHourAndMinutesBothRollOver()
        Dim sut = New Clock(-25, -160)
        Assert.Equal("20:20", sut.ToString())
    End Sub
    <Fact>
    Public Sub NegativeHourAndMinutesBothRollOverContinuously()
        Dim sut = New Clock(-121, -5810)
        Assert.Equal("22:10", sut.ToString())
    End Sub
    <Fact>
    Public Sub AddMinutes()
        Dim sut = New Clock(10, 0)
        Assert.Equal("10:03", sut.Add(3).ToString())
    End Sub
    <Fact>
    Public Sub AddNoMinutes()
        Dim sut = New Clock(6, 41)
        Assert.Equal("06:41", sut.Add(0).ToString())
    End Sub
    <Fact>
    Public Sub AddToNextHour()
        Dim sut = New Clock(0, 45)
        Assert.Equal("01:25", sut.Add(40).ToString())
    End Sub
    <Fact>
    Public Sub AddMoreThanOneHour()
        Dim sut = New Clock(10, 0)
        Assert.Equal("11:01", sut.Add(61).ToString())
    End Sub
    <Fact>
    Public Sub AddMoreThanTwoHoursWithCarry()
        Dim sut = New Clock(0, 45)
        Assert.Equal("03:25", sut.Add(160).ToString())
    End Sub
    <Fact>
    Public Sub AddAcrossMidnight()
        Dim sut = New Clock(23, 59)
        Assert.Equal("00:01", sut.Add(2).ToString())
    End Sub
    <Fact>
    Public Sub AddMoreThanOneDay1500Min25Hrs()
        Dim sut = New Clock(5, 32)
        Assert.Equal("06:32", sut.Add(1500).ToString())
    End Sub
    <Fact>
    Public Sub AddMoreThanTwoDays()
        Dim sut = New Clock(1, 1)
        Assert.Equal("11:21", sut.Add(3500).ToString())
    End Sub
    <Fact>
    Public Sub SubtractMinutes()
        Dim sut = New Clock(10, 3)
        Assert.Equal("10:00", sut.Subtract(3).ToString())
    End Sub
    <Fact>
    Public Sub SubtractToPreviousHour()
        Dim sut = New Clock(10, 3)
        Assert.Equal("09:33", sut.Subtract(30).ToString())
    End Sub
    <Fact>
    Public Sub SubtractMoreThanAnHour()
        Dim sut = New Clock(10, 3)
        Assert.Equal("08:53", sut.Subtract(70).ToString())
    End Sub
    <Fact>
    Public Sub SubtractAcrossMidnight()
        Dim sut = New Clock(0, 3)
        Assert.Equal("23:59", sut.Subtract(4).ToString())
    End Sub
    <Fact>
    Public Sub SubtractMoreThanTwoHours()
        Dim sut = New Clock(0, 0)
        Assert.Equal("21:20", sut.Subtract(160).ToString())
    End Sub
    <Fact>
    Public Sub SubtractMoreThanTwoHoursWithBorrow()
        Dim sut = New Clock(6, 15)
        Assert.Equal("03:35", sut.Subtract(160).ToString())
    End Sub
    <Fact>
    Public Sub SubtractMoreThanOneDay1500Min25Hrs()
        Dim sut = New Clock(5, 32)
        Assert.Equal("04:32", sut.Subtract(1500).ToString())
    End Sub
    <Fact>
    Public Sub SubtractMoreThanTwoDays()
        Dim sut = New Clock(2, 20)
        Assert.Equal("00:20", sut.Subtract(3000).ToString())
    End Sub
    <Fact>
    Public Sub ClocksWithSameTime()
        Dim sut = New Clock(15, 37)
        Dim sut2 = New Clock(15, 37)
        'Assert.Equal(new Clock(15, 37), sut);
        Assert.Equal(sut, sut2)
    End Sub
    <Fact>
    Public Sub ClocksAMinuteApart()
        Dim sut = New Clock(15, 37)
        Assert.NotEqual(New Clock(15, 36), sut)
    End Sub
    <Fact>
    Public Sub ClocksAnHourApart()
        Dim sut = New Clock(15, 37)
        Assert.NotEqual(New Clock(14, 37), sut)
    End Sub
    <Fact>
    Public Sub ClocksWithHourOverflow()
        Dim sut = New Clock(34, 37)
        Assert.Equal(New Clock(10, 37), sut)
    End Sub
    <Fact>
    Public Sub ClocksWithHourOverflowBySeveralDays()
        Dim sut = New Clock(99, 11)
        Assert.Equal(New Clock(3, 11), sut)
    End Sub
    <Fact>
    Public Sub ClocksWithNegativeHour()
        Dim sut = New Clock(-2, 40)
        Assert.Equal(New Clock(22, 40), sut)
    End Sub
    <Fact>
    Public Sub ClocksWithNegativeHourThatWraps()
        Dim sut = New Clock(-31, 3)
        Assert.Equal(New Clock(17, 3), sut)
    End Sub
    <Fact>
    Public Sub ClocksWithNegativeHourThatWrapsMultipleTimes()
        Dim sut = New Clock(-83, 49)
        Assert.Equal(New Clock(13, 49), sut)
    End Sub
    <Fact>
    Public Sub ClocksWithMinuteOverflow()
        Dim sut = New Clock(0, 1441)
        Assert.Equal(New Clock(0, 1), sut)
    End Sub
    <Fact>
    Public Sub ClocksWithMinuteOverflowBySeveralDays()
        Dim sut = New Clock(2, 4322)
        Assert.Equal(New Clock(2, 2), sut)
    End Sub
    <Fact>
    Public Sub ClocksWithNegativeMinute()
        Dim sut = New Clock(3, -20)
        Assert.Equal(New Clock(2, 40), sut)
    End Sub
    <Fact>
    Public Sub ClocksWithNegativeMinuteThatWraps()
        Dim sut = New Clock(5, -1490)
        Assert.Equal(New Clock(4, 10), sut)
    End Sub
    <Fact>
    Public Sub ClocksWithNegativeMinuteThatWrapsMultipleTimes()
        Dim sut = New Clock(6, -4305)
        Assert.Equal(New Clock(6, 15), sut)
    End Sub
    <Fact>
    Public Sub ClocksWithNegativeHoursAndMinutes()
        Dim sut = New Clock(-12, -268)
        Assert.Equal(New Clock(7, 32), sut)
    End Sub
    <Fact>
    Public Sub ClocksWithNegativeHoursAndMinutesThatWrap()
        Dim sut = New Clock(-54, -11513)
        Assert.Equal(New Clock(18, 7), sut)
    End Sub
    <Fact>
    Public Sub FullClockAndZeroedClock()
        Dim sut = New Clock(0, 0)
        Assert.Equal(New Clock(24, 0), sut)
    End Sub
    <Fact>
    Public Sub ClocksAreImmutable()
        Dim sut = New Clock(0, 0)
        Dim sutPlus1 = sut.Add(1)
        Assert.NotEqual(sutPlus1, sut)
    End Sub
End Class
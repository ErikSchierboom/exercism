Imports System
Imports Xunit
Public Class CollatzConjectureTests
    <Fact>
    Public Sub ZeroStepsForOne()
        Assert.Equal(0, Steps(1))
    End Sub
    <Fact>
    Public Sub DivideIfEven()
        Assert.Equal(4, Steps(16))
    End Sub
    <Fact>
    Public Sub EvenAndOddSteps()
        Assert.Equal(9, Steps(12))
    End Sub
    <Fact>
    Public Sub LargeNumberOfEvenAndOddSteps()
        Assert.Equal(152, Steps(1000000))
    End Sub
    <Fact>
    Public Sub ZeroIsAnError()
        Assert.Throws(Of ArgumentOutOfRangeException)(Function() Steps(0))
    End Sub
    <Fact>
    Public Sub NegativeValueIsAnError()
        Assert.Throws(Of ArgumentOutOfRangeException)(Function() Steps(-15))
    End Sub
End Class
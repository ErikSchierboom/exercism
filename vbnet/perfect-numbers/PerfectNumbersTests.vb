Imports System
Imports Xunit
Public Class PerfectNumbersTests
    <Fact>
    Public Sub SmallestPerfectNumberIsClassifiedCorrectly()
        Assert.Equal(Classification.Perfect, Classify(6))
    End Sub
    <Fact>
    Public Sub MediumPerfectNumberIsClassifiedCorrectly()
        Assert.Equal(Classification.Perfect, Classify(28))
    End Sub
    <Fact>
    Public Sub LargePerfectNumberIsClassifiedCorrectly()
        Assert.Equal(Classification.Perfect, Classify(33550336))
    End Sub
    <Fact>
    Public Sub SmallestAbundantNumberIsClassifiedCorrectly()
        Assert.Equal(Classification.Abundant, Classify(12))
    End Sub
    <Fact>
    Public Sub MediumAbundantNumberIsClassifiedCorrectly()
        Assert.Equal(Classification.Abundant, Classify(30))
    End Sub
    <Fact>
    Public Sub LargeAbundantNumberIsClassifiedCorrectly()
        Assert.Equal(Classification.Abundant, Classify(33550335))
    End Sub
    <Fact>
    Public Sub SmallestPrimeDeficientNumberIsClassifiedCorrectly()
        Assert.Equal(Classification.Deficient, Classify(2))
    End Sub
    <Fact>
    Public Sub SmallestNonPrimeDeficientNumberIsClassifiedCorrectly()
        Assert.Equal(Classification.Deficient, Classify(4))
    End Sub
    <Fact>
    Public Sub MediumDeficientNumberIsClassifiedCorrectly()
        Assert.Equal(Classification.Deficient, Classify(32))
    End Sub
    <Fact>
    Public Sub LargeDeficientNumberIsClassifiedCorrectly()
        Assert.Equal(Classification.Deficient, Classify(33550337))
    End Sub
    <Fact>
    Public Sub EdgeCaseNoFactorsOtherThanItselfIsClassifiedCorrectly()
        Assert.Equal(Classification.Deficient, Classify(1))
    End Sub
    <Fact>
    Public Sub ZeroIsRejectedNotANaturalNumber()
        Assert.Throws(Of ArgumentOutOfRangeException)(Function() Classify(0))
    End Sub
    <Fact>
    Public Sub NegativeIntegerIsRejectedNotANaturalNumber()
        Assert.Throws(Of ArgumentOutOfRangeException)(Function() Classify(-1))
    End Sub
End Class
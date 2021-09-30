Imports System
Imports Xunit
Public Class PhoneNumberTests
    <Fact>
    Public Sub CleansTheNumber()
        Dim phrase = "(223) 456-7890"
        Assert.Equal("2234567890", PhoneNumber.Clean(phrase))
    End Sub
    <Fact>
    Public Sub CleansNumbersWithDots()
        Dim phrase = "223.456.7890"
        Assert.Equal("2234567890", PhoneNumber.Clean(phrase))
    End Sub
    <Fact>
    Public Sub CleansNumbersWithMultipleSpaces()
        Dim phrase = "223 456   7890   "
        Assert.Equal("2234567890", PhoneNumber.Clean(phrase))
    End Sub
    <Fact>
    Public Sub InvalidWhen9Digits()
        Dim phrase = "123456789"
        Assert.Throws(Of ArgumentException)(Function() PhoneNumber.Clean(phrase))
    End Sub
    <Fact>
    Public Sub InvalidWhen11DigitsDoesNotStartWithA1()
        Dim phrase = "22234567890"
        Assert.Throws(Of ArgumentException)(Function() PhoneNumber.Clean(phrase))
    End Sub
    <Fact>
    Public Sub ValidWhen11DigitsAndStartingWith1()
        Dim phrase = "12234567890"
        Assert.Equal("2234567890", PhoneNumber.Clean(phrase))
    End Sub
    <Fact>
    Public Sub ValidWhen11DigitsAndStartingWith1EvenWithPunctuation()
        Dim phrase = "+1 (223) 456-7890"
        Assert.Equal("2234567890", PhoneNumber.Clean(phrase))
    End Sub
    <Fact>
    Public Sub InvalidWhenMoreThan11Digits()
        Dim phrase = "321234567890"
        Assert.Throws(Of ArgumentException)(Function() PhoneNumber.Clean(phrase))
    End Sub
    <Fact>
    Public Sub InvalidWithLetters()
        Dim phrase = "123-abc-7890"
        Assert.Throws(Of ArgumentException)(Function() PhoneNumber.Clean(phrase))
    End Sub
    <Fact>
    Public Sub InvalidWithPunctuations()
        Dim phrase = "123-@:!-7890"
        Assert.Throws(Of ArgumentException)(Function() PhoneNumber.Clean(phrase))
    End Sub
    <Fact>
    Public Sub InvalidIfAreaCodeStartsWith0()
        Dim phrase = "(023) 456-7890"
        Assert.Throws(Of ArgumentException)(Function() PhoneNumber.Clean(phrase))
    End Sub
    <Fact>
    Public Sub InvalidIfAreaCodeStartsWith1()
        Dim phrase = "(123) 456-7890"
        Assert.Throws(Of ArgumentException)(Function() PhoneNumber.Clean(phrase))
    End Sub
    <Fact>
    Public Sub InvalidIfExchangeCodeStartsWith0()
        Dim phrase = "(223) 056-7890"
        Assert.Throws(Of ArgumentException)(Function() PhoneNumber.Clean(phrase))
    End Sub
    <Fact>
    Public Sub InvalidIfExchangeCodeStartsWith1()
        Dim phrase = "(223) 156-7890"
        Assert.Throws(Of ArgumentException)(Function() PhoneNumber.Clean(phrase))
    End Sub
    <Fact>
    Public Sub InvalidIfAreaCodeStartsWith0OnValid11DigitNumber()
        Dim phrase = "1 (023) 456-7890"
        Assert.Throws(Of ArgumentException)(Function() PhoneNumber.Clean(phrase))
    End Sub
    <Fact>
    Public Sub InvalidIfAreaCodeStartsWith1OnValid11DigitNumber()
        Dim phrase = "1 (123) 456-7890"
        Assert.Throws(Of ArgumentException)(Function() PhoneNumber.Clean(phrase))
    End Sub
    <Fact>
    Public Sub InvalidIfExchangeCodeStartsWith0OnValid11DigitNumber()
        Dim phrase = "1 (223) 056-7890"
        Assert.Throws(Of ArgumentException)(Function() PhoneNumber.Clean(phrase))
    End Sub
    <Fact>
    Public Sub InvalidIfExchangeCodeStartsWith1OnValid11DigitNumber()
        Dim phrase = "1 (223) 156-7890"
        Assert.Throws(Of ArgumentException)(Function() PhoneNumber.Clean(phrase))
    End Sub
End Class
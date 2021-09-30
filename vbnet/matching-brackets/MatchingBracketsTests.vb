Imports Xunit
Public Class MatchingBracketsTests
    <Fact>
    Public Sub PairedSquareBrackets()
        Dim value = "[]"
        Assert.True(IsPaired(value))
    End Sub
    <Fact>
    Public Sub EmptyString()
        Dim value = ""
        Assert.True(IsPaired(value))
    End Sub
    <Fact>
    Public Sub UnpairedBrackets()
        Dim value = "[["
        Assert.False(IsPaired(value))
    End Sub
    <Fact>
    Public Sub WrongOrderedBrackets()
        Dim value = "}{"
        Assert.False(IsPaired(value))
    End Sub
    <Fact>
    Public Sub WrongClosingBracket()
        Dim value = "{]"
        Assert.False(IsPaired(value))
    End Sub
    <Fact>
    Public Sub PairedWithWhitespace()
        Dim value = "{ }"
        Assert.True(IsPaired(value))
    End Sub
    <Fact>
    Public Sub PartiallyPairedBrackets()
        Dim value = "{[])"
        Assert.False(IsPaired(value))
    End Sub
    <Fact>
    Public Sub SimpleNestedBrackets()
        Dim value = "{[]}"
        Assert.True(IsPaired(value))
    End Sub
    <Fact>
    Public Sub SeveralPairedBrackets()
        Dim value = "{}[]"
        Assert.True(IsPaired(value))
    End Sub
    <Fact>
    Public Sub PairedAndNestedBrackets()
        Dim value = "([{}({}[])])"
        Assert.True(IsPaired(value))
    End Sub
    <Fact>
    Public Sub UnopenedClosingBrackets()
        Dim value = "{[)][]}"
        Assert.False(IsPaired(value))
    End Sub
    <Fact>
    Public Sub UnpairedAndNestedBrackets()
        Dim value = "([{])"
        Assert.False(IsPaired(value))
    End Sub
    <Fact>
    Public Sub PairedAndWrongNestedBrackets()
        Dim value = "[({]})"
        Assert.False(IsPaired(value))
    End Sub
    <Fact>
    Public Sub PairedAndIncompleteBrackets()
        Dim value = "{}["
        Assert.False(IsPaired(value))
    End Sub
    <Fact>
    Public Sub TooManyClosingBrackets()
        Dim value = "[]]"
        Assert.False(IsPaired(value))
    End Sub
    <Fact>
    Public Sub MathExpression()
        Dim value = "(((185 + 223.85) * 15) - 543)/2"
        Assert.True(IsPaired(value))
    End Sub
    <Fact>
    Public Sub ComplexLatexExpression()
        Dim value = "\left(\begin{array}{cc} \frac{1}{3} & x\\ \mathrm{e}^{x} &... x^2 \end{array}\right)"
        Assert.True(IsPaired(value))
    End Sub
End Class
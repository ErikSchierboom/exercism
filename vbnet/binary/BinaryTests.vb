Imports XUnit


Public Class BinaryTest
	<Fact>
    Public Sub BinaryCanConvertFormattedStrings()
        Assert.Equal(New Binary("011").ToDecimal(), 3)
    End Sub

    <Theory>
    <InLineData("1", 1)>
    <InLineData("10", 2)>
    <InLineData("11", 3)>
    <InLineData("100", 4)>
    <InLineData("1001", 9)>
    <InLineData("11010", 26)>
    <InLineData("10001101000", 1128)>
    Public Sub BinaryConvertsToDecimal(binary As String, expected as integer)
        Assert.Equal( New Binary(binary).ToDecimal(), expected)
    End Sub

	<Theory>
    <InLineData("carrot")>
    <InLineData("2")>
    <InLineData("5")>
    <InLineData("9")>
    <InLineData("134678")>
    <InLineData("abc10z")>
    Public Sub InvalidBinaryIsDecimal0(invalidValue As String)
        Assert.Equal(New Binary(invalidValue).ToDecimal(), 0)
    End Sub

End Class

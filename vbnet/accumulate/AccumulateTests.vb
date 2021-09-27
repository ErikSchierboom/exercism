Imports XUnit


Public Class AccumulateTest
    <Fact>
    Public Sub EmptyAccumulationProducesEmptyAccumulation()
        Assert.Equal(New Integer() {}.Accumulate(Function(x) x * x), New Integer() {})
    End Sub

    <Fact>
    Public Sub AccumulateSquares()
        Assert.Equal({1, 2, 3}.Accumulate(Function(x) x * x),{1, 4, 9})
    End Sub

    <Fact>
    Public Sub AccumulateUpcases()
        Assert.Equal(New List(Of String)() From {
            "hello",
            "world"
        }.Accumulate(Function(x) x.ToUpper()), New List(Of String) From {
            "HELLO",
            "WORLD"
        })
    End Sub

    <Fact>
    Public Sub AccumulateReversedStrings()
        Assert.Equal("the quick brown fox etc".Split(" "c).Accumulate(AddressOf Reverse), "eht kciuq nworb xof cte".Split(" "c))
    End Sub

    Private Shared Function Reverse(value As String) As String
        Dim chars = value.ToCharArray()
        Array.Reverse(chars)
        Return New String(chars)
    End Function

    <Fact>
    Public Sub AccumulateWithinAccumulate()
        Dim actual = New String() {"a", "b", "c"}.Accumulate(Function(c) String.Join(" ", New String() {"1", "2", "3"}.Accumulate(Function(d) c & d)))
        Assert.Equal(actual, New String() {"a1 a2 a3", "b1 b2 b3", "c1 c2 c3"})
    End Sub

    <Fact>
    Public Sub AccumulateIsLazy()
        Dim counter = 0
        Dim accumulation = New Integer() {1, 2, 3}.Accumulate(Function(x) x * System.Math.Max(System.Threading.Interlocked.Increment(counter), counter - 1))

        Assert.Equal(counter, 0)
        accumulation.ToList()
        Assert.Equal(counter, 3)
    End Sub
End Class

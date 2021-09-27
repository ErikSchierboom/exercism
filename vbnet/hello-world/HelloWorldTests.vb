Imports Xunit

Public Class HelloWorldTest
    <Fact>
    Public Sub Say_hi_()
        Assert.Equal("Hello, World!", HelloWorld.Hello())
    End Sub
End Class
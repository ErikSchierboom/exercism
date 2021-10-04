Imports System.Collections.Generic
Imports Xunit
Public Class HighScoresTest
    <Fact>
    Public Sub ListOfScores()
        Dim sut = New HighScores(New List(Of Integer) From {
            30,
            50,
            20,
            70
        })
        Assert.Equal(New List(Of Integer) From {
            30,
            50,
            20,
            70
        }, sut.Scores())
    End Sub
    <Fact>
    Public Sub LatestScore()
        Dim sut = New HighScores(New List(Of Integer) From {
            100,
            0,
            90,
            30
        })
        Assert.Equal(30, sut.Latest())
    End Sub
    <Fact>
    Public Sub PersonalBest()
        Dim sut = New HighScores(New List(Of Integer) From {
            40,
            100,
            70
        })
        Assert.Equal(100, sut.PersonalBest())
    End Sub
    <Fact>
    Public Sub PersonalTopThreeFromAListOfScores()
        Dim sut = New HighScores(New List(Of Integer) From {
            10,
            30,
            90,
            30,
            100,
            20,
            10,
            0,
            30,
            40,
            40,
            70,
            70
        })
        Assert.Equal(New List(Of Integer) From {
            100,
            90,
            70
        }, sut.PersonalTopThree())
    End Sub
    <Fact>
    Public Sub PersonalTopHighestToLowest()
        Dim sut = New HighScores(New List(Of Integer) From {
            20,
            10,
            30
        })
        Assert.Equal(New List(Of Integer) From {
            30,
            20,
            10
        }, sut.PersonalTopThree())
    End Sub
    <Fact>
    Public Sub PersonalTopWhenThereIsATie()
        Dim sut = New HighScores(New List(Of Integer) From {
            40,
            20,
            40,
            30
        })
        Assert.Equal(New List(Of Integer) From {
            40,
            40,
            30
        }, sut.PersonalTopThree())
    End Sub
    <Fact>
    Public Sub PersonalTopWhenThereAreLessThan3()
        Dim sut = New HighScores(New List(Of Integer) From {
            30,
            70
        })
        Assert.Equal(New List(Of Integer) From {
            70,
            30
        }, sut.PersonalTopThree())
    End Sub
    <Fact>
    Public Sub PersonalTopWhenThereIsOnlyOne()
        Dim sut = New HighScores(New List(Of Integer) From {
            40
        })
        Assert.Equal(New List(Of Integer) From {
            40
        }, sut.PersonalTopThree())
    End Sub
End Class
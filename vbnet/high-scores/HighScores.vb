Imports System
Imports System.Linq

Public Class HighScores
    Private ReadOnly _scores As List(Of Integer)

    Public Sub New(scores As List(Of Integer))
        _scores = scores
    End Sub

    Public Function Scores() As List(Of Integer)
        Return _scores    
    End Function

    Public Function Latest() As Integer
        Return _scores.Last()
    End Function

    Public Function PersonalBest() As Integer
        Return _scores.Max()
    End Function

    Public Function PersonalTopThree() As List(Of Integer)
        Return _scores.OrderByDescending(Function (score) score).Take(3).ToList()
    End Function
End Class

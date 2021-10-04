Imports System.Collections.Generic

Public Module MatchingBrackets
    Private ReadOnly ClosingToOpeningBrackets As Dictionary(Of Char, Char) =
        New Dictionary(Of Char,Char)() From { { "]"c, "["c }, { "}"c, "{"c }, { ")"c, "("c } }

    Public Function IsPaired(input As String) As Boolean
        Dim unpairedBrackets = New Stack(Of Char)
        Dim openingBracket
        
        For Each character In input
            If IsOpeningBracket(character)
                unpairedBrackets.Push(character)
            Else If TryGetOpeningBracketForClosingBracket(character, openingBracket)
                If Not ClosingBracketMatchesLastUnpairedBracket(unpairedBrackets, openingBracket) 
                    Return false
                End If
                                
                unpairedBrackets.Pop()
            End If
        Next
        
        Return Not unpairedBrackets.Any()
    End Function
    
    Private Function IsOpeningBracket(character As Char) As Boolean 
        Return ClosingToOpeningBrackets.Values.Contains(character)
    End Function

    Private Function TryGetOpeningBracketForClosingBracket(character As Char, ByRef openingBracket As Char) As Boolean
        Return ClosingToOpeningBrackets.TryGetValue(character, openingBracket)
    End Function

    Private Function ClosingBracketMatchesLastUnpairedBracket(unpairedBrackets As Stack(Of Char), openingBracket As Char) As Boolean
        Dim topUnpairedBracket
        
        Return unpairedBrackets.TryPeek(topUnpairedBracket) And topUnpairedBracket = openingBracket
    End Function
End Module

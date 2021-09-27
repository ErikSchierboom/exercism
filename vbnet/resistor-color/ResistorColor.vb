Imports System

Public Module ResistorColor
    
    Public Function ColorCode(ByVal color As String) As Integer
        return Array.IndexOf(Colors(), color)
    End Function

    Public Function Colors() As String()
        return { "black", "brown", "red", "orange", "yellow", "green", "blue", "violet", "grey", "white" }
    End Function

End Module
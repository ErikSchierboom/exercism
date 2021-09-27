Public Class Bob

    Public Function Hey(statement As String) As String
        If IsSilence(statement)
            return "Fine. Be that way!"
        ElseIf IsYell(statement) And IsQuestion(statement)
            return "Calm down, I know what I'm doing!"
        ElseIf IsYell(statement)
            return "Whoa, chill out!"
        ElseIf IsQuestion(statement)
            return "Sure."
        Else
            return "Whatever."
        End If
    End Function

    Private Shared Function IsSilence(statement As String) As Boolean
        return String.IsNullOrWhiteSpace(statement)
    End Function

    Private Shared Function IsYell(statement As String) As Boolean
        return statement.Any(AddressOf Char.IsLetter) and statement.ToUpperInvariant() = statement
    End Function

    Private Shared Function IsQuestion(statement As String) As Boolean
        return statement.TrimEnd().EndsWith("?")
    End Function
End Class
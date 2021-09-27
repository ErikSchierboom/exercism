Public Module ReverseString
    Public Function Reverse(inputString As String) As String
        return New String(inputString.Reverse().ToArray())
    End Function
End Module

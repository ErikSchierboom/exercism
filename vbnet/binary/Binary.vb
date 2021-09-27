Public Class Binary
    Private ReadOnly _digits As Char()
    
    Public Sub New(binary As String)
        _digits = binary.ToCharArray()
    End Sub

    Public Function ToDecimal() As Integer
        Dim dec = 0
        
        For Each digit in _digits
            If digit = "0"
               dec = dec << 1
            ElseIf digit = "1"
                dec = (dec << 1) + 1
            Else 
                Return 0
            End If
        Next
        
        Return dec
    End Function
End Class

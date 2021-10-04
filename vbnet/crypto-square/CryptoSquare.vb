Imports System.Runtime.CompilerServices

Module Crypto
    Public Function Ciphertext(plaintext As String) As String
        If plaintext.Length = 0
            Return ""
        Else
            Return String.Join(" ", plaintext.Normalized().Rows().Columns())
        End If
    End Function
	
    <Extension>
    Private Function Normalized(str As String) As String
        Return New String(str.Where(AddressOf Char.IsLetterOrDigit).Select(AddressOf Char.ToLower).ToArray())
    End Function
	
    <Extension>
    Private Function Size(str As String) As Integer
        Return Math.Ceiling(Math.Sqrt(str.length))
    End Function
	
    <Extension>
    Private Function Rows(str As String) As List(Of String)
        Dim size = str.Size()
        Return str.Chunks(size).Select(Function(row) row.PadRight(size)).ToList()
    End Function

    <Extension>
    Private Function Columns(rows As List(Of String)) As List(Of String)
        Return Enumerable.Range(0, rows(0).Length).
            Select(Function(i) String.Concat(rows.Select(Function(row) row(i)))).
            ToList()
    End Function

    <Extension>
    Private Iterator Function Chunks(str As String, size As Integer) As IEnumerable(Of String)
        For i = 0 To str.Length - 1 Step size
            Yield str.Substring(i, Math.Min(str.Length - i, size))
        Next
    End Function
End Module

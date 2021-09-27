Imports System.Linq

Public Module Hamming
    Public Function Distance(firstStrand As String, secondStrand As String) As Integer
        If firstStrand.Length <> secondStrand.Length
            Throw New ArgumentException("Strands have different length")
        End If

        Return firstStrand.Zip(secondStrand).Count(Function(pair) pair.First <> pair.Second)
    End Function
End Module
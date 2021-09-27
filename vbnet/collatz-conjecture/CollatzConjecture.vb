Imports System

Public Module CollatzConjecture
    Public Function Steps(number As Integer) As Integer
        If number <= 0 
            Throw New ArgumentOutOfRangeException()
        End If
        
        Dim remainder = number
        Dim stepCount = 0

        While remainder <> 1
            If remainder Mod 2 = 0
                remainder = remainder / 2
            Else
                remainder = remainder * 3 + 1
            End If
            stepCount += 1
        End While

        Return stepCount
    End Function
End Module
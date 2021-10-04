Imports System
Imports System.Linq

Public Enum Classification
    Perfect
    Abundant
    Deficient
End Enum

Public Module PerfectNumbers
    Public Function Classify(number As Integer) As Classification
        If number < 1 
            Throw New ArgumentOutOfRangeException()
        End If
        
        Dim sum As Integer = AliquotSum(number)
        If sum > number 
            Return Classification.Abundant
        ElseIf sum < number
            Return Classification.Deficient
        Else
            Return Classification.Perfect
        End If
    End Function
    
    Private Function AliquotSum(number As Integer) As Integer
        Return Enumerable.Range(1, number / 2).Where(Function(x) number Mod x = 0).Sum()
    End Function
End Module

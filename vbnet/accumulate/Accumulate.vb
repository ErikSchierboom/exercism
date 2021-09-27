Imports System.Runtime.CompilerServices

Module AccumulateExtensions
    
    <Extension> 
    Public Iterator Function Accumulate(Of T)(aSource As IEnumerable(Of T), aMap As Func(Of T, T)) As IEnumerable(Of T)
        For Each element In aSource
            Yield aMap(element)
        Next
    End Function

End Module
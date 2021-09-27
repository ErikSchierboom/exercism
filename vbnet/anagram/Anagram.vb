imports System
imports System.Collections.Generic
Imports System.Linq

Public Class Anagram
    Private ReadOnly _word As String
    
    Public Sub New(word As String)
        _word = word
    End Sub

    Public Function Match(candidates As String()) As IEnumerable(Of String)
        Return candidates.Where(AddressOf IsAnagram).OrderBy(Function(w) w).ToArray()
    End Function
    
    Private Function IsAnagram(candidate As String) As Boolean
        Return SortedLowerCase(candidate) = SortedLowerCase(_word) And IsDifferentFromWord(candidate)
    End Function
    
    Private Function IsDifferentFromWord(candidate As String) As Boolean
        Return Not String.Equals(candidate, _word, StringComparison.OrdinalIgnoreCase)
    End Function
    
    Private Function SortedLowerCase(word As String) As String
        Return New String(word.ToLower().OrderBy(Function(c) c).ToArray())
    End Function
End Class

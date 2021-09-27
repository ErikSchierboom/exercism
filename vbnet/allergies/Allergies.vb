Imports System.Linq
Imports System.Collections.Generic

Public Class Allergies
    Private ReadOnly _allergies As List(Of String)
    Private ReadOnly _allergens As List(Of String) = New List(Of String)({"eggs", "peanuts", "shellfish", "strawberries", "tomatoes", "chocolate", "pollen", "cats"})

    Public Sub New(codedAllergies As Integer)
        _allergies = _allergens.
            Where(Function(allergen, shiftLeft) (codedAllergies And 1 << shiftLeft) <> 0).
            Select(Function(allergen) allergen.ToString().ToLower()).
            ToList()
    End Sub

    Public Function List() As List(Of String)
        return _allergies
    End Function

    Public Function AllergicTo(allergen As String) As Boolean
        return _allergies.Contains(allergen)
    End Function
End Class
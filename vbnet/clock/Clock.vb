Public Class Clock
    Private Const MinutesPerHour = 60
    Private Const MinutesPerDay = 1440
    
    Private Readonly _minutes As Integer
    Private Readonly _hours As Integer
    
    Public Sub New(hours As Integer, minutes As Integer)
        _hours = Math.DivRem(Modulo(hours * MinutesPerHour + minutes, MinutesPerDay), MinutesPerHour, _minutes)
    End Sub

    Public Function Add(minutesToAdd As Integer) As Clock
        Return New Clock(_hours, _minutes + minutesToAdd)
    End Function

    Public Function Subtract(minutesToSubtract As Integer) As Clock
        Return New Clock(_hours, _minutes - minutesToSubtract)
    End Function

    Public Overrides Function ToString() As String
        Return $"{_hours:00}:{_minutes:00}"
    End Function

    Public Overrides Function Equals(obj As Object) As Boolean
        If obj Is Nothing OrElse Not Me.GetType() Is obj.GetType() Then
            Return False
        End If
        
        Dim other = CType(obj, Clock)
        Return _hours = other._hours And _minutes = other._minutes
    End Function

    Private Shared Function Modulo(x As Integer, y As Integer) As Integer
        Return (x Mod y + y) Mod y
    End Function
End Class

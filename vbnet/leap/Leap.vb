Public Module Leap
    Public Function IsLeapYear(year As Integer) As Boolean
        return year Mod 400 = 0 Or (year Mod 4 = 0 And year Mod 100 <> 0)
    End Function
End Module
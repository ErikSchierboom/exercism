Imports System.Text.RegularExpressions

Public Class PhoneNumber
    Public Shared Function Clean(phoneNumber As String) As String
        Dim sanitized = Sanitize(phoneNumber)
        
        If Valid(sanitized)
            Return sanitized    
        End If
        
        Throw New ArgumentException()
    End Function

    Private Shared Function Sanitize(phoneNumber As String) As String
        Dim sanitized = Regex.Replace(phoneNumber, "\(|\)|\.|\-|\+| ", "")
        
        If sanitized.Length = 11 And sanitized.StartsWith("1")  
            Return sanitized.Substring(1)
        End If
        
        Return sanitized
    End Function

    Private Shared Function Valid(phoneNumber As String) As Boolean
        Return Regex.IsMatch(phoneNumber, "^([2-9]\d{2}){2}\d{4}$")
    End Function
End Class

Imports System
Imports System.Linq
Imports System.Collections.Generic

Public Module AllYourBase
    Public Function Rebase(inputBase As Integer, inputDigits As Integer(), outputBase As Integer) As Integer()
        If inputBase < 2 
            Throw New ArgumentException("Invalid input base.")
        ElseIf outputBase < 2
            Throw New ArgumentException("Invalid output base.")
        End If
        
        Dim inputDigitsWithoutLeadingZeros = inputDigits.SkipWhile(Function(digit) digit = 0).ToArray()
        If inputDigitsWithoutLeadingZeros.Length = 0 
            Return { 0 }
        End If

        Return ToDigits(outputBase, FromDigits(inputBase, inputDigitsWithoutLeadingZeros))
    End Function
    
    Private Function FromDigits(base As Integer, digits As Integer()) As Integer
        Return digits.Aggregate(0, Function(acc, x) 
            If x < 0 Or x >= base
                Throw New ArgumentException("Invalid input digit")
            End If
        
            Return acc * base + x
        End Function)
    End Function
    
    Private Function ToDigits(toBase As Integer, x As Integer) As Integer()
        Dim digits = new List(Of Integer)
        Dim remainder = x
        Dim multiplier = 1

        While remainder > 0
            multiplier *= toBase

            Dim value = remainder Mod multiplier
            Dim digit = value/(multiplier/toBase)

            digits.Add(digit)
            remainder -= value
        End While

        digits.Reverse()
        Return digits.ToArray()
    End Function
End Module

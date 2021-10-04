Imports System.Linq
Imports System.Collections.Generic
Imports System.Runtime.CompilerServices

Public Module Atbash
    Private Const Letters As String = "abcdefghijklmnopqrstuvwxyz"
    Private ReadOnly EncodingMap As Dictionary(Of Char, Char) = Letters.Zip(Letters.Reverse()).ToDictionary(Function(x) x.Item1, Function(x) x.Item2)

    Public Function Encode(plaintext As String) As String
        Return plaintext.
            ToLower().
            Where(AddressOf Char.IsLetterOrDigit).
            Chunk(5).
            Select(Function(chunk) chunk.Select(AddressOf Encode).Join()).
            Join()
    End Function

    Public Function Decode(ciphertext As String) As String
        Return Encode(ciphertext).Where(AddressOf Char.IsLetterOrDigit).Join()
    End Function
    
    Private Function Encode(c As Char) As Char
        Return EncodingMap.GetValueOrDefault(c, c)
    End Function
    
    <Extension>
    Private Iterator Function Chunk(chars As IEnumerable(Of Char), size As Integer) As IEnumerable(Of String)
        Dim str = chars.Join()
        
        For index = 0 To str.Length - 1 Step size
            Yield str.Substring(index, Math.Min(size, str.Length - index))
        Next        
    End Function

    <Extension>
    Private Function Join(chars As IEnumerable(Of Char)) As String
        Return New String(chars.ToArray())
    End Function

    <Extension>
    Private Function Join(strings As IEnumerable(Of String)) As String
        Return String.Join(" ", strings)
    End Function
End Module

'

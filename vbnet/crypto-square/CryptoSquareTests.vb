Imports XUnit

Public Class CryptoSquareTest
    <Fact>
    Public Sub EmptyPlaintextResultsInAnEmptyplaintext()
        Dim plaintext = ""
        Assert.Equal("", Ciphertext(plaintext))
    End Sub
    
    <Fact>
    Public Sub Lowercase()
        Dim plaintext = "A"
        Assert.Equal("a", Ciphertext(plaintext))
    End Sub
    
    <Fact>
    Public Sub RemoveSpaces()
        Dim plaintext = "  b "
        Assert.Equal("b", Ciphertext(plaintext))
    End Sub
    
    <Fact>
    Public Sub RemovePunctuation()
        Dim plaintext = "@1,%!"
        Assert.Equal("1", Ciphertext(plaintext))
    End Sub
    
    <Fact>
    Public Sub NineCharacterPlaintextResultsInThreeChunksOfThreeCharacters()
        Dim plaintext = "This is fun!"
        Assert.Equal("tsf hiu isn", Ciphertext(plaintext))
    End Sub

    <Fact>
    Public Sub EightCharacterPlaintextResultsInThreeChunksTheLastOneWithATrailingSpace()
        Dim plaintext = "Chill out."
        Assert.Equal("clu hlt io ", Ciphertext(plaintext))
    End Sub

    <Fact>
    Public Sub FiftyFourCharacterPlaintextResultsInSevenChunksTheTwoWithTrailingSpaces()
        Dim plaintext = "If man was meant to stay on the ground, god would have given us roots."
        Assert.Equal("imtgdvs fearwer mayoogo anouuio ntnnlvt wttddes aohghn  sseoau ", Ciphertext(plaintext))
    End Sub
End Class

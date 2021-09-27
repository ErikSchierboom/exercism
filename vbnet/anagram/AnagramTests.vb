Imports XUnit


Public Class AnagramTest
    <Fact>
    Public Sub NoMatches()
        Dim detector = New Anagram("diaper")
        Dim words = New String() {"hello", "world", "zombies", "pants"}
        Dim results = New String() {}
        Assert.Equal(detector.Match(words), results)
    End Sub

    <Fact>
    Public Sub DetectSimpleAnagram()
        Dim detector = New Anagram("ant")
        Dim words = New String() {"tan", "stand", "at"}
        Dim results = New String() {"tan"}
        Assert.Equal(detector.Match(words), results)
    End Sub

    <Fact>
    Public Sub DetectMultipleAnagrams()
        Dim detector = New Anagram("master")
        Dim words = New String() {"stream", "pigeon", "maters"}
        Dim results = New String() {"maters", "stream"}
        Assert.Equal(detector.Match(words), results)
    End Sub

    <Fact>
    Public Sub DoesNotConfuseDifferentDuplicates()
        Dim detector = New Anagram("galea")
        Dim words = New String() {"eagle"}
        Dim results = New String() {}
        Assert.Equal(detector.Match(words), results)
    End Sub

    <Fact>
    Public Sub IdenticalWordIsNotAnagram()
        Dim detector = New Anagram("corn")
        Dim words = New String() {"corn", "dark", "Corn", "rank", "CORN", "cron",
            "park"}
        Dim results = New String() {"cron"}
        Assert.Equal(detector.Match(words), results)
    End Sub

    <Fact>
    Public Sub EliminateAnagramsWithSameChecksum()
        Dim detector = New Anagram("mass")
        Dim words = New String() {"last"}
        Dim results = New String(-1) {}
        Assert.Equal(detector.Match(words), results)
    End Sub

    <Fact>
    Public Sub EliminateAnagramSubsets()
        Dim detector = New Anagram("good")
        Dim words = New String() {"dog", "goody"}
        Dim results = New String(-1) {}
        Assert.Equal(detector.Match(words), results)
    End Sub

    <Fact>
    Public Sub DetectAnagrams()
        Dim detector = New Anagram("allergy")
        Dim words = New String() {"gallery", "ballerina", "regally", "clergy", "largely", "leading"}
        Dim results = New String() {"gallery", "largely", "regally"}
        Assert.Equal(detector.Match(words), results)
    End Sub

    <Fact>
    Public Sub AnagramsAreCaseInsensitive()
        Dim detector = New Anagram("Orchestra")
        Dim words = New String() {"cashregister", "Carthorse", "radishes"}
        Dim results = New String() {"Carthorse"}
        Assert.Equal(detector.Match(words), results)
    End Sub

End Class

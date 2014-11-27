module RobotName

type RobotName() =
    let letters = ['A'..'Z']
    let digits = ['0'..'9']

    let NumberOfLetters = 2;
    let NumberOfDigits = 3

    let random = System.Random()

    let takeRandomElements xs length = [for x in 1 .. length -> List.nth xs (random.Next(List.length xs))]
    let generateRandomString chars length = new System.String(takeRandomElements chars length |> List.toArray)
    let generateLetters() = generateRandomString letters NumberOfLetters
    let generateDigits() = generateRandomString digits NumberOfDigits
    let generateName() = generateLetters() + generateDigits()
    
    member val Name = generateName() with get, set
    member this.Reset() = this.Name <- generateName()
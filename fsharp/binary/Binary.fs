module Binary

type Binary(input: string) =

    let isValid char = 
        match char with
        | '0' | '1' -> true
        | _  -> false

    let charToDecimal char = (int)char - (int)'0'

    member this.toDecimal() = 
        let chars = input.ToCharArray()
        if Array.forall isValid chars then Array.fold (fun acc c -> acc * 2 + charToDecimal c) 0 chars
        else 0
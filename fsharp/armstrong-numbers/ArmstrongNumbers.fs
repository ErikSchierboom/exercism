module ArmstrongNumbers

let isArmstrongNumber number = 
    let charToDigit char = int char - int '0'
    let digits = number |> string |> Seq.map charToDigit |> Seq.toList
    let numberOfDigits = List.length digits
    let digitToPower digit = pown digit numberOfDigits

    List.sumBy digitToPower digits = number
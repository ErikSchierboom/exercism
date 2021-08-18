module ArmstrongNumbers

open System.Globalization

let private armstrongSum number =
    let digits = number.ToString() |> Seq.map CharUnicodeInfo.GetDigitValue |> Seq.toList
    let digitToPower digit = pown digit digits.Length
    List.sumBy digitToPower digits

let isArmstrongNumber number = armstrongSum number = number

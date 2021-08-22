module PhoneNumber

let clean input = 
    let digits = String.filter System.Char.IsDigit input
    let digitsMinusCountryCode = if digits.[0] = '1' then digits.[1..] else digits

    if digitsMinusCountryCode.Length = 10 &&
        digitsMinusCountryCode.[0] <> '0' && digitsMinusCountryCode.[0] <> '1' &&
        digitsMinusCountryCode.[3] <> '0' && digitsMinusCountryCode.[3] <> '1' then
        Some digitsMinusCountryCode
    else
        None

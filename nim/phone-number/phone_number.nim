import strutils

const Length = 11

proc digitsOnly(phoneNumber: string): string =
  for c in phoneNumber:
    if isDigit(c):
      result.add(c)

proc missingCountryCode(phoneNumber: string): bool =
  phoneNumber.len < Length

proc addCountryCode(phoneNumber: var string): void =
  phoneNumber = '1' & phoneNumber

proc removeCountryCode(phoneNumber: var string): void =
  phoneNumber = phoneNumber[1..^1]

proc countryCode(phoneNumber: string): char =
  phoneNumber[0]

proc areaCode(phoneNumber: string): string =
  phoneNumber[1..3]

proc exchangeCode(phoneNumber: string): string =
  phoneNumber[4..6]

proc invalidLength(phoneNumber: string): bool =
  phoneNumber.len != Length

proc invalidCountryCode(phoneNumber: string): bool =
  phoneNumber.countryCode != '1'

proc invalidExchangeCode(phoneNumber: string): bool =
  phoneNumber.exchangeCode.startsWith('0') or
  phoneNumber.exchangeCode.startsWith('1')

proc invalidAreaCode(phoneNumber: string): bool =
  phoneNumber.areaCode.startsWith('0') or
  phoneNumber.areaCode.startsWith('1')

proc clean*(phoneNumber: string): string =
  result = phoneNumber.digitsOnly

  if result.missingCountryCode:
    result.addCountryCode

  if result.invalidLength or
     result.invalidCountryCode or
     result.invalidAreaCode or
     result.invalidExchangeCode:
    raise newException(ValueError, "Invalid phone number")

  result.removeCountryCode

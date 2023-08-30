import Foundation
import RegexBuilder

class PhoneNumber : CustomStringConvertible {
  let number: String
  let areaCode: String
  let exchangeCode: String
  let subscriberNumber: String
  var description: String

  init(_ input: String) {
    let number = Regex {
      Anchor.startOfLine
      Optionally { "1" }
      Capture { One(.anyOf("23456789")); Repeat(.digit, count: 2) }
      Capture { One(.anyOf("23456789")); Repeat(.digit, count: 2) }
      Capture { Repeat(.digit, count: 4) }
      Anchor.endOfLine
    }

    let sanitizedInput = input.replacing(".", with: "")
      .replacing("-", with: "")
      .replacing(" ", with: "")
      .replacing("(", with: "")
      .replacing(")", with: "")

    print(sanitizedInput)
    if let match = sanitizedInput.firstMatch(of: number) {
      let (_, areaCode, exchangeCode, subscriberNumber) = match.output
      self.areaCode = String(areaCode)
      self.exchangeCode = String(exchangeCode)
      self.subscriberNumber = String(subscriberNumber)
      self.number = self.areaCode + self.exchangeCode + self.subscriberNumber
      self.description = "(\(areaCode)) \(exchangeCode)-\(subscriberNumber)"
    } else {
      self.areaCode = ""
      self.exchangeCode = ""
      self.subscriberNumber = ""
      self.number = "0000000000"
      self.description = "0000000000"
    }
  }

  
}
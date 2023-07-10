struct SecretHandshake {
    let command: Int
    let codesToAction : [(code: Int, action: ([String]) -> [String])] =
        [
            (0b00001, { $0 + ["wink"] }),
            (0b00010, { $0 + ["double blink"] }),
            (0b00100, { $0 + ["close your eyes"] }),
            (0b01000, { $0 + ["jump"] }),
            (0b10000, { $0.reversed() })
        ]

    init(_ command: Int) { self.command = command }

    var commands: [String] {
        codesToAction.reduce([], { acc, codeToAction in
            codeToAction.code & command > 0 ? codeToAction.action(acc) : acc
        })
    }
}
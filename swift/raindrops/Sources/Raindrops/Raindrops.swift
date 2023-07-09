struct Raindrops {
    let sounds: String

    init(_ number: Int) {
        var sounds = ""

        if (number % 3 == 0) { sounds += "Pling" }
        if (number % 5 == 0) { sounds += "Plang" }
        if (number % 7 == 0) { sounds += "Plong" }
        if (sounds.isEmpty) { sounds = String(number) }

        self.sounds = sounds
    }
}

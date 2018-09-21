import RotationalCipher from "./rotational-cipher"

describe("RotationalCipher", () => {
    it("rotate a by 1", () => {
        const result = RotationalCipher.rotate("a", 1)
        expect(result).toEqual("b")
    })

    it("rotate a by 26, same output as input", () => {
        const result = RotationalCipher.rotate("a", 26)
        expect(result).toEqual("a")
    })

    it("rotate a by 0, same output as input", () => {
        const result = RotationalCipher.rotate("a", 0)
        expect(result).toEqual("a")
    })

    it("rotate m by 13", () => {
        const result = RotationalCipher.rotate("m", 13)
        expect(result).toEqual("z")
    })

    it("rotate n by 13 with wrap around alphabet", () => {
        const result = RotationalCipher.rotate("n", 13)
        expect(result).toEqual("a")
    })

    it("rotate capital letters", () => {
        const result = RotationalCipher.rotate("OMG", 5)
        expect(result).toEqual("TRL")
    })

    it("rotate spaces", () => {
        const result = RotationalCipher.rotate("O M G", 5)
        expect(result).toEqual("T R L")
    })

    it("rotate numbers", () => {
        const result = RotationalCipher.rotate("Testing 1 2 3 testing", 4)
        expect(result).toEqual("Xiwxmrk 1 2 3 xiwxmrk")
    })

    it("rotate punctuation", () => {
        const result = RotationalCipher.rotate("Let's eat, Grandma!", 21)
        expect(result).toEqual("Gzo'n zvo, Bmviyhv!")
    })

    it("rotate all letters", () => {
        const result = RotationalCipher.rotate(
            "The quick brown fox jumps over the lazy dog.",
            13
        )
        expect(result).toEqual("Gur dhvpx oebja sbk whzcf bire gur ynml qbt.")
    })
})

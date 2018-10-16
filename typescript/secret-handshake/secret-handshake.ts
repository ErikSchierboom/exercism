const commandMapping: Array<[number, string]> = [
    [1 << 0, "wink"],
    [1 << 1, "double blink"],
    [1 << 2, "close your eyes"],
    [1 << 3, "jump"]
]

export default class SecretHandshake {
    private n: number

    constructor(n: number) {
        this.n = n
    }

    public commands(): string[] {
        const handshake = commandMapping
            .filter(([mask, _]) => (this.n & mask) !== 0)
            .map(([_, str]) => str)

        return this.shouldReverse ? handshake.reverse() : handshake
    }

    private get shouldReverse() {
        return (this.n & 1 << 4) !== 0
    }
}
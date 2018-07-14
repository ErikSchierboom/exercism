export default class SecretHandshake {
    constructor(number) {
        if (!/^\d+$/.test(number))
            throw new Error('Handshake must be a number')

        this.number = number;
    } 

    commands() {
        const commandMapping = [
             [1 << 0, "wink"],
             [1 << 1, "double blink"],
             [1 << 2, "close your eyes"],
             [1 << 3, "jump"]
        ];

        const acc = [];

        for (const [mask, str] of commandMapping) {
            if ((this.number & mask) !== 0)
                acc.push(str);
        }

        if ((this.number & 1 << 4) !== 0)
            acc.reverse();

        return acc;
    }
}
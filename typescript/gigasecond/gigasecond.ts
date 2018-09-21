export default class Gigasecond {
    private readonly birthDate: Date

    constructor(birthDate: Date) {
        this.birthDate = birthDate
    }

    date() {
        return new Date(this.birthDate.getTime() + 1E9 * 1000)
    }
}
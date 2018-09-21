export default class Gigasecond {
    private readonly birthDate: Date

    constructor(birthDate: Date) {
        this.birthDate = birthDate
    }

    date() {
        const gigasecond = new Date(this.birthDate)
        gigasecond.setUTCSeconds(gigasecond.getUTCSeconds() + 1E9)
        return gigasecond
    }
}
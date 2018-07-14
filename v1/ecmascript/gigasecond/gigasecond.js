export default class Gigasecond {
    constructor(currentDate) {
        this.currentDate = currentDate;
    }

    date() {
        return new Date(this.currentDate.getTime() + 1000000000000);
    }
}
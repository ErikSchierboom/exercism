export default class SpaceAge {
    constructor(seconds) {
        this.seconds = seconds;
    }

    onMercury() {
        return this.calculateAge(0.2408467);
    }

    onVenus() {
        return this.calculateAge(0.61519726);
    }

    onEarth() {
        return this.calculateAge(1);
    }

    onMars() {
        return this.calculateAge(1.8808158);
    }

    onJupiter() {
        return this.calculateAge(11.862615);
    }

    onSaturn() {
        return this.calculateAge(29.447498);
    }

    onUranus() {
        return this.calculateAge(84.016846);
    }

    onNeptune() {
        return this.calculateAge(164.79132);
    }

    calculateAge(periodInEarthYears) {
        const earthOrbitInSeconds = 31557600;
        return parseFloat((this.seconds / (earthOrbitInSeconds * periodInEarthYears)).toFixed(2));
    }
}
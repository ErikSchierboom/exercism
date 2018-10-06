export default class SpaceAge {
  public seconds: number

  constructor(seconds: number) {
    this.seconds = seconds
  }

  public onMercury(): number {
    return this.calculateAge(0.2408467)
  }

  public onVenus(): number {
    return this.calculateAge(0.61519726)
  }

  public onEarth(): number {
    return this.calculateAge(1)
  }

  public onMars(): number {
    return this.calculateAge(1.8808158)
  }

  public onJupiter(): number {
    return this.calculateAge(11.862615)
  }

  public onSaturn() {
    return this.calculateAge(29.447498)
  }

  public onUranus(): number {
    return this.calculateAge(84.016846)
  }

  public onNeptune(): number {
    return this.calculateAge(164.79132)
  }

  private calculateAge(periodInEarthYears: number): number {
    const earthOrbitInSeconds = 31557600
    return parseFloat(
      (this.seconds / (earthOrbitInSeconds * periodInEarthYears)).toFixed(2)
    )
  }
}

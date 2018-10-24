function random(min: number, max: number): number {
  return Math.floor(Math.random() * (max - min)) + min
}

function randomFromArray<T>(array: T[]): T {
  return array[random(0, array.length - 1)]
}

function randomLetter(): string {
  return randomFromArray(Array.from("ABCDEFGHIJKLMNOPQRSTUVWXYZ"))
}

function randomDigit(): string {
  return randomFromArray(Array.from("0123456789"))
}

const generatedNames = new Set()

function randomName(): string {
  const name = `${randomLetter()}${randomLetter()}${randomDigit()}${randomDigit()}${randomDigit()}`

  if (generatedNames.has(name)) {
    return randomName()
  }

  generatedNames.add(name)
  return name
}

export default class Robot {
  private _name: string

  constructor() {
    this._name = ''
    this.resetName()
  }

  public get name(): string {
    return this._name
  }

  public resetName(): void {
    this._name = randomName()
  }
}
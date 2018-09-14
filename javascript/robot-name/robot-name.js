function getRandomInt(min, max) {
  min = Math.ceil(min);
  max = Math.floor(max);
  return Math.floor(Math.random() * (max - min)) + min;
}

Array.prototype.random = function() {
    return this[getRandomInt(0, this.length)];
}

const generatedNames = new Set();

function randomLetter() {
    const letters = [..."ABCDEFGHIJKLMNOPQRSTUVWXYZ"];
    return letters.random();
}

function randomDigit() {
    const digits = [..."0123456789"];
    return digits.random();
}

function randomName() {
    const name = `${randomLetter()}${randomLetter()}${randomDigit()}${randomDigit()}${randomDigit()}`;

    if (generatedNames.has(name)) {
        return randomName();
    }
    
    generatedNames.add(name);
    return name;
}

export default class Robot {
    constructor() {
        this._name = '';
        this.reset();
    }

    get name() {
        return this._name;
    }

    reset() {
        this._name = randomName();
    }
}
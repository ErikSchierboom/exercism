function getRandomInt(min, max) {
  min = Math.ceil(min);
  max = Math.floor(max);
  return Math.floor(Math.random() * (max - min)) + min;
}

Array.prototype.random = function() {
    return this[getRandomInt(0, this.length)];
}

const alphabet = "abcdefghijklmnopqrstuvwxyz";
const letters = [...alphabet];

function randomLetter() {
    return letters.random();
}

function randomString(length) {
    let str = '';

    for (let i = 0; i < length; i++)
        str += randomLetter();

    return str;
}

function mod(x, y) {
    return Math.floor((x % y + y) % y);
}

export default class Cipher {
    constructor(key) {
        if (key === '')
            throw new Error('Bad key');

        this._key = key || this.generateKey();

        if (!/^[a-z]+$/.test(this._key))
            throw new Error('Bad key');
    }

    generateKey() {
        const keyLength = 100;
        return randomString(keyLength);
    }

    get key() {
        return this._key;
    }

    encode(plainText) {
        return this.shift(plainText, (c, s) => c + s);
    }

    decode(encryptedText) {
        return this.shift(encryptedText, (c, s) => c - s);
    }

    shift(text, applyShift) {
        let shifted = '';

        for (let i = 0; i < text.length; i++)
            shifted += String.fromCharCode(this.shiftCharacter(text[i], i, applyShift));

        return shifted;
    }

    shiftCharacter(c, i, applyShift) {
        return 'a'.charCodeAt() + this.getCharacterShiftValue(c, i, applyShift);
    }

    getCharacterShiftValue(c, i, applyShift) {
        return mod(applyShift(this.normalizeCharacter(c), this.getShiftValue(i)), letters.length);
    }

    normalizeCharacter(c) {
        return c.charCodeAt() - 'a'.charCodeAt();
    }

    getShiftValue(i) {
        return this.key.charCodeAt(i) % 'a'.charCodeAt();
    }
}
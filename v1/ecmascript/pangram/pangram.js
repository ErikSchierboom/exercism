export default class Pangram {
    constructor(input) {
        this.input = input;
    }

    isPangram() {
        const letters = [..."abcdefghijklmnopqrstuvwxyz"];
        const lowerCaseInput = this.input.toLowerCase(); 
        return letters.every(lettter => lowerCaseInput.includes(lettter));
    }
}
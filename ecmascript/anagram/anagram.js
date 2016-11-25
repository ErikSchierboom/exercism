export default class Anagram {
    constructor(input) {
        this.input = input.toLowerCase();
        this.sortedInput = this.sortedCharArrayForString(input);
    }

    matches(...candidates) {
        candidates = Array.isArray(candidates[0]) ? candidates[0] : candidates;

        return candidates.filter(word => this.isAnagram(word));
    }
    
    isAnagram(word) {
        return this.notSameAsInput(word) && 
               this.hasSameLettersAsInput(word);
    }

    notSameAsInput(word) {
        return this.input !== word.toLowerCase();
    }

    hasSameLettersAsInput(word) {
        return this.sortedCharArrayForString(word) === this.sortedInput;
    }

    sortedCharArrayForString(word) {
        return [...word.toLowerCase()].sort().join('');
    }
}
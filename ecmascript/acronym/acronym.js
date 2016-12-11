export default class Acronyms {
    static parse(input) {
        return input
            .match(/[A-Z]+[a-z]*|[a-z]+/g)
            .map(str => str.toUpperCase()[0])
            .join('');
    }
}
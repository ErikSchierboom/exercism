export default class School {
    constructor() {
        this._roster = {};
    }

    roster() {
        return this.clone(this._roster);
    }

    add(student, grade) {
        if (!this._roster.hasOwnProperty(grade)) {
            this._roster[grade] = [];
        }

        this._roster[grade].push(student);
        this._roster[grade].sort();
    }

    grade(value) {
        if (this._roster.hasOwnProperty(value)) {
            return this.clone(this._roster[value].slice(0));
        }

        return []; 
    }

    clone(a) {
        return JSON.parse(JSON.stringify(a));
    }
}
Array.prototype.distinct = function() {
    return this.filter((v, i, a) => a.indexOf(v) === i);
}

export default class CustomSet {
    constructor(data = []) {
        this._data = data.distinct().sort();
    }

    get data() {
        return this._data;
    }

    put(value) {
        return new CustomSet(this.data.concat([value]));
    }

    member(value) {
        return this.data.indexOf(value) !== -1;
    } 

    delete(value) {
        if (!this.member(value))
            return new CustomSet(this.data);

        const copy = this.data.slice(0);
        copy.splice(this.data.indexOf(value), 1);    
        return new CustomSet(copy);
    }

    eql(other) {
        return this.data.join('|') === other.data.join('|');
    }

    union(other) {
        return new CustomSet(this.data.concat(other.data));
    }

    intersection(other) {
        return new CustomSet(this.data.filter(x => other.member(x)));
    }

    difference(other) {
        return new CustomSet(this.data.filter(x => !other.member(x)));
    }

    disjoint(other) {
        return other.data.every(x => !this.member(x));
    }

    subset(other) {
        return other.data.every(x => this.member(x));
    }

    sort() {
        return this;
    }

    size() {
        return this.data.length;
    }

    toList() {
        return this.data;
    }

    empty() {
        return new CustomSet();
    }
}
Array.prototype.isSorted = function() {
    for (let i = 0; i < this.length - 2; i++) {
        if (this[i] > this[i + 1])
            return false;
    }

    return true;
}

export default class BinarySearch {
    constructor(input) {
        this._array = input.isSorted() ? input : undefined;
    }

    get array() {
        return this._array;
    }

    indexOf(value) {
        if (this.array.length === 0)
            return -1;

        return this.indexOfRange(value, 0, this.array.length - 1);
    }

    indexOfRange(value, minIndex, maxIndex) {
         var middleIndex = Math.round((minIndex + maxIndex) / 2);

        if (this.array[middleIndex] == value)
            return middleIndex;

        if (middleIndex <= 0 || middleIndex >= this.array.length - 1 || middleIndex < minIndex)
            return -1;

        if (this.array[middleIndex] > value)
            return this.indexOfRange(value, minIndex, middleIndex - 1);

        return this.indexOfRange(value, middleIndex + 1, maxIndex);
    }
}
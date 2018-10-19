function distinct<T>(array: T[]) {
    return array.filter((v, i, a) => a.indexOf(v) === i)
}

export default class CustomSet {
    private data: number[]

    constructor(data: number[] = []) {
        this.data = distinct(data).sort()
    }

    add(value: number) {
        return new CustomSet(this.data.concat([value]))
    }

    contains(value: number): boolean {
        return this.data.indexOf(value) !== -1
    }

    eql(other: CustomSet): boolean {
        return this.data.join('|') === other.data.join('|')
    }

    union(other: CustomSet): CustomSet {
        return new CustomSet(this.data.concat(other.data))
    }

    intersection(other: CustomSet): CustomSet {
        return new CustomSet(this.data.filter((x) => other.contains(x)))
    }

    difference(other: CustomSet): CustomSet {
        return new CustomSet(this.data.filter((x) => !other.contains(x)))
    }

    disjoint(other: CustomSet): boolean {
        return other.data.every((x) => !this.contains(x))
    }

    subset(other: CustomSet): boolean {
        return this.data.every((x) => other.contains(x))
    }

    empty(): boolean {
        return this.data.length === 0
    }
}
export enum Bucket {
    One,
    Two
}

export class TwoBucketInstance {
    private _contents: number
    private _capacity: number

    constructor(contents: number, capacity: number) {
        this._contents = contents
        this._capacity = capacity
    }

    get contents() {
        return this._contents
    }

    set contents(value) {
        this._contents = value
    }

    get capacity() {
        return this._capacity
    }

    empty() {
        this.contents = 0
    }

    fill() {
        this.contents = this.capacity
    }

    get isEmpty() {
        return this.contents === 0
    }

    get isFull() {
        return this.contents === this.capacity
    }
}

export class TwoBucket {
    private bucketOne: TwoBucketInstance
    private bucketTwo: TwoBucketInstance
    private goal: number
    private movesCount: number
    private _goalBucket: string
    private _otherBucket: number
    private strategy: () => void

    constructor(bucketOne: number, bucketTwo: number, goal: number, starterBucket: Bucket) {
        this.bucketOne = new TwoBucketInstance(starterBucket === Bucket.One ? bucketOne : 0, bucketOne)
        this.bucketTwo = new TwoBucketInstance(starterBucket === Bucket.Two ? bucketTwo : 0, bucketTwo)
        this.goal = goal
        this.movesCount = 0
        this.strategy = starterBucket === Bucket.One ? this.startFromFirstBucket : this.startFromSecondBucket
        this.solve()
    }

    public moves() {
        return this.movesCount
    }

    get goalBucket() {
        return this._goalBucket
    }

    get otherBucket() {
        return this._otherBucket
    }

    public solve() {
        this.movesCount++

        if (this.bucketOne.contents === this.goal) {
            this._goalBucket = 'one'
            this._otherBucket = this.bucketTwo.contents
        }
        else if (this.bucketTwo.contents === this.goal) {
            this._goalBucket = 'two'
            this._otherBucket = this.bucketOne.contents
        }
        else {
            this.strategy()
            this.solve()
        }
    }

    private startFromFirstBucket() {
        if (this.bucketOne.isEmpty) {
            this.bucketOne.fill()
        } else if (this.bucketTwo.isFull) {
            this.bucketTwo.empty()
        } else if (this.canPourToSecondBucket()) {
            this.pourFromFirstToSecond()
        } else {
            throw new Error('Cannot transition from state.')
        }
    }

    private startFromSecondBucket() {
        if (this.bucketOne.isFull) {
            this.bucketOne.empty()
        } else if (this.bucketTwo.isEmpty) {
            this.bucketTwo.fill()
        } else if (this.canPourToFirstBucket()) {
            this.pourFromSecondToFirst()
        } else {
            throw new Error('Cannot transition from state.')
        }
    }

    private pourFromFirstToSecond() {
        const amount = Math.min(this.bucketTwo.capacity - this.bucketTwo.contents, this.bucketOne.contents)
        this.bucketOne.contents -= amount
        this.bucketTwo.contents += amount
    }

    private pourFromSecondToFirst() {
        const amount = Math.min(this.bucketOne.capacity - this.bucketOne.contents, this.bucketTwo.contents)
        this.bucketOne.contents += amount
        this.bucketTwo.contents -= amount
    }

    private canPourToFirstBucket() {
        return this.bucketOne.contents + this.bucketTwo.contents !== this.bucketOne.capacity
    }

    private canPourToSecondBucket() {
        return this.bucketOne.isFull && !this.bucketTwo.isFull ||
            !this.bucketOne.isFull && this.bucketTwo.isEmpty
    }
}
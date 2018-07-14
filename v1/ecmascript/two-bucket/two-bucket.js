class Bucket {
    constructor(contents, capacity) {
        this._contents = contents;
        this._capacity = capacity;
    }

    get contents() {
        return this._contents;
    }

    set contents(value) {
        this._contents = value;
    }

    get capacity() {
        return this._capacity;
    }

    empty() {
        this.contents = 0;
    }

    fill() {
        this.contents = this.capacity;
    }

    get isEmpty() {
        return this.contents === 0;
    }
    
    get isFull() {
        return this.contents === this.capacity;
    }
}

export default class TwoBucket {
    constructor(bucketOne, bucketTwo, goal, starterBucket) {
        this.bucketOne = new Bucket(starterBucket === 'one' ? bucketOne : 0, bucketOne);
        this.bucketTwo = new Bucket(starterBucket === 'two' ? bucketTwo : 0, bucketTwo);
        this.goal = goal;
        this.movesCount = 0;
        this.strategy = starterBucket === 'one' ? this.startFromFirstBucket : this.startFromSecondBucket;
        this.solve();
    }

    moves() {
        return this.movesCount;
    }

    get goalBucket() {
        return this._goalBucket;
    }

    get otherBucket() {
        return this._otherBucket;
    }

    solve() {
        this.movesCount++;

        if (this.bucketOne.contents === this.goal) {
            this._goalBucket = 'one';
            this._otherBucket = this.bucketTwo.contents;
        } 
        else if (this.bucketTwo.contents === this.goal) {
            this._goalBucket = 'two';
            this._otherBucket = this.bucketOne.contents;
        }
        else {
            this.strategy();
            this.solve();
        }
    }

    startFromFirstBucket() {
        if (this.bucketOne.isEmpty) 
            this.bucketOne.fill();
        else if (this.bucketTwo.isFull)
            this.bucketTwo.empty();
        else if (this.canPourToSecondBucket())
            this.pourFromFirstToSecond();
        else
            throw new Error('Cannot transition from state.');
     } 
    
    startFromSecondBucket() {
        if (this.bucketOne.isFull)
            this.bucketOne.empty();
        else if (this.bucketTwo.isEmpty)
            this.bucketTwo.fill();
        else if (this.canPourToFirstBucket())
            this.pourFromSecondToFirst();
        else
            throw new Error('Cannot transition from state.');
    } 

    pourFromFirstToSecond() {
        const amount = Math.min(this.bucketTwo.capacity - this.bucketTwo.contents, this.bucketOne.contents)
        this.bucketOne.contents -= amount;
        this.bucketTwo.contents += amount;
    } 

    pourFromSecondToFirst() {
        const amount = Math.min(this.bucketOne.capacity - this.bucketOne.contents, this.bucketTwo.contents)
        this.bucketOne.contents += amount;
        this.bucketTwo.contents -= amount;
    }

    canPourToFirstBucket() {
        return this.bucketOne.contents + this.bucketTwo.contents !== this.bucketOne.capacity;
    }

    canPourToSecondBucket() {
        return this.bucketOne.isFull && !this.bucketTwo.isFull ||
               !this.bucketOne.isFull && this.bucketTwo.isEmpty; 
    }
}
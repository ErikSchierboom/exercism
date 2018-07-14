'use strict';

Object.defineProperty(exports, '__esModule', {
    value: true
});

var _createClass = (function () { function defineProperties(target, props) { for (var i = 0; i < props.length; i++) { var descriptor = props[i]; descriptor.enumerable = descriptor.enumerable || false; descriptor.configurable = true; if ('value' in descriptor) descriptor.writable = true; Object.defineProperty(target, descriptor.key, descriptor); } } return function (Constructor, protoProps, staticProps) { if (protoProps) defineProperties(Constructor.prototype, protoProps); if (staticProps) defineProperties(Constructor, staticProps); return Constructor; }; })();

function _classCallCheck(instance, Constructor) { if (!(instance instanceof Constructor)) { throw new TypeError('Cannot call a class as a function'); } }

var Bucket = (function () {
    function Bucket(contents, capacity) {
        _classCallCheck(this, Bucket);

        this._contents = contents;
        this._capacity = capacity;
    }

    _createClass(Bucket, [{
        key: 'empty',
        value: function empty() {
            this.contents = 0;
        }
    }, {
        key: 'fill',
        value: function fill() {
            this.contents = this.capacity;
        }
    }, {
        key: 'contents',
        get: function get() {
            return this._contents;
        },
        set: function set(value) {
            this._contents = value;
        }
    }, {
        key: 'capacity',
        get: function get() {
            return this._capacity;
        }
    }, {
        key: 'isEmpty',
        get: function get() {
            return this.contents === 0;
        }
    }, {
        key: 'isFull',
        get: function get() {
            return this.contents === this.capacity;
        }
    }]);

    return Bucket;
})();

var TwoBucket = (function () {
    function TwoBucket(bucketOne, bucketTwo, goal, starterBucket) {
        _classCallCheck(this, TwoBucket);

        this.bucketOne = new Bucket(starterBucket === 'one' ? bucketOne : 0, bucketOne);
        this.bucketTwo = new Bucket(starterBucket === 'two' ? bucketTwo : 0, bucketTwo);
        this.goal = goal;
        this.movesCount = 0;
        this.strategy = starterBucket === 'one' ? this.startFromFirstBucket : this.startFromSecondBucket;
        this.solve();
    }

    _createClass(TwoBucket, [{
        key: 'moves',
        value: function moves() {
            return this.movesCount;
        }
    }, {
        key: 'solve',
        value: function solve() {
            this.movesCount++;

            if (this.bucketOne.contents === this.goal) {
                this._goalBucket = 'one';
                this._otherBucket = this.bucketTwo.contents;
            } else if (this.bucketTwo.contents === this.goal) {
                this._goalBucket = 'two';
                this._otherBucket = this.bucketOne.contents;
            } else {
                this.strategy();
                this.solve();
            }
        }
    }, {
        key: 'startFromFirstBucket',
        value: function startFromFirstBucket() {
            if (this.bucketOne.isEmpty) this.bucketOne.fill();else if (this.bucketTwo.isFull) this.bucketTwo.empty();else if (this.canPourToSecondBucket()) this.pourFromFirstToSecond();else throw new Error('Cannot transition from state.');
        }
    }, {
        key: 'startFromSecondBucket',
        value: function startFromSecondBucket() {
            if (this.bucketOne.isFull) this.bucketOne.empty();else if (this.bucketTwo.isEmpty) this.bucketTwo.fill();else if (this.canPourToFirstBucket()) this.pourFromSecondToFirst();else throw new Error('Cannot transition from state.');
        }
    }, {
        key: 'pourFromFirstToSecond',
        value: function pourFromFirstToSecond() {
            var amount = Math.min(this.bucketTwo.capacity - this.bucketTwo.contents, this.bucketOne.contents);
            this.bucketOne.contents -= amount;
            this.bucketTwo.contents += amount;
        }
    }, {
        key: 'pourFromSecondToFirst',
        value: function pourFromSecondToFirst() {
            var amount = Math.min(this.bucketOne.capacity - this.bucketOne.contents, this.bucketTwo.contents);
            this.bucketOne.contents += amount;
            this.bucketTwo.contents -= amount;
        }
    }, {
        key: 'canPourToFirstBucket',
        value: function canPourToFirstBucket() {
            return this.bucketOne.contents + this.bucketTwo.contents !== this.bucketOne.capacity;
        }
    }, {
        key: 'canPourToSecondBucket',
        value: function canPourToSecondBucket() {
            return this.bucketOne.isFull && !this.bucketTwo.isFull || !this.bucketOne.isFull && this.bucketTwo.isEmpty;
        }
    }, {
        key: 'goalBucket',
        get: function get() {
            return this._goalBucket;
        }
    }, {
        key: 'otherBucket',
        get: function get() {
            return this._otherBucket;
        }
    }]);

    return TwoBucket;
})();

exports['default'] = TwoBucket;
module.exports = exports['default'];
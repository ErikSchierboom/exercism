"use strict";

Object.defineProperty(exports, "__esModule", {
    value: true
});

var _createClass = (function () { function defineProperties(target, props) { for (var i = 0; i < props.length; i++) { var descriptor = props[i]; descriptor.enumerable = descriptor.enumerable || false; descriptor.configurable = true; if ("value" in descriptor) descriptor.writable = true; Object.defineProperty(target, descriptor.key, descriptor); } } return function (Constructor, protoProps, staticProps) { if (protoProps) defineProperties(Constructor.prototype, protoProps); if (staticProps) defineProperties(Constructor, staticProps); return Constructor; }; })();

function _classCallCheck(instance, Constructor) { if (!(instance instanceof Constructor)) { throw new TypeError("Cannot call a class as a function"); } }

var Node = (function () {
    function Node(data) {
        var previous = arguments.length <= 1 || arguments[1] === undefined ? null : arguments[1];
        var next = arguments.length <= 2 || arguments[2] === undefined ? null : arguments[2];

        _classCallCheck(this, Node);

        this._data = data;
        this._previous = previous;
        this._next = next;
    }

    _createClass(Node, [{
        key: "data",
        get: function get() {
            return this._data;
        }
    }, {
        key: "previous",
        get: function get() {
            return this._previous;
        },
        set: function set(value) {
            this._previous = value;
        }
    }, {
        key: "next",
        get: function get() {
            return this._next;
        },
        set: function set(value) {
            this._next = value;
        }
    }]);

    return Node;
})();

var LinkedList = (function () {
    function LinkedList() {
        _classCallCheck(this, LinkedList);

        this.first = null;
        this.last = null;
        this._count = 0;
    }

    _createClass(LinkedList, [{
        key: "push",
        value: function push(value) {
            if (this.last == null) {
                this.addToEmptyList(value);
            } else {
                this.last = this.last.next = new Node(value, this.last, null);
            }

            this.itemAdded();
        }
    }, {
        key: "pop",
        value: function pop() {
            var value = this.last.data;
            this.last = this.last.previous;

            if (this.last !== null) this.last.next = null;else this.first = null;

            this.itemRemoved();

            return value;
        }
    }, {
        key: "unshift",
        value: function unshift(value) {
            if (this.first == null) {
                this.addToEmptyList(value);
            } else {
                this.first = this.first.previous = new Node(value, null, this.first);
            }

            this.itemAdded();
        }
    }, {
        key: "shift",
        value: function shift() {
            var value = this.first.data;
            this.first = this.first.next;

            if (this.first !== null) this.first.previous = null;else this.last = null;

            this.itemRemoved();

            return value;
        }
    }, {
        key: "count",
        value: function count() {
            return this._count;
        }
    }, {
        key: "delete",
        value: function _delete(value) {
            var current = this.first;

            while (current !== null) {
                if (current.data === value) {
                    if (current.next) current.next.previous = current.previous;

                    if (current.previous) current.previous.next = current.next;

                    if (current === this.first) this.first = current.next;

                    if (current === this.last) this.last = current.previous;

                    this.itemRemoved();

                    return;
                }

                current = current.next;
            }
        }
    }, {
        key: "addToEmptyList",
        value: function addToEmptyList(value) {
            this.first = this.last = new Node(value);
        }
    }, {
        key: "itemAdded",
        value: function itemAdded() {
            this._count++;
        }
    }, {
        key: "itemRemoved",
        value: function itemRemoved() {
            this._count--;
        }
    }]);

    return LinkedList;
})();

exports["default"] = LinkedList;
module.exports = exports["default"];
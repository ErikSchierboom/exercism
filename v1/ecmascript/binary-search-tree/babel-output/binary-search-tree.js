"use strict";

Object.defineProperty(exports, "__esModule", {
    value: true
});

var _createClass = (function () { function defineProperties(target, props) { for (var i = 0; i < props.length; i++) { var descriptor = props[i]; descriptor.enumerable = descriptor.enumerable || false; descriptor.configurable = true; if ("value" in descriptor) descriptor.writable = true; Object.defineProperty(target, descriptor.key, descriptor); } } return function (Constructor, protoProps, staticProps) { if (protoProps) defineProperties(Constructor.prototype, protoProps); if (staticProps) defineProperties(Constructor, staticProps); return Constructor; }; })();

function _classCallCheck(instance, Constructor) { if (!(instance instanceof Constructor)) { throw new TypeError("Cannot call a class as a function"); } }

var BinarySearchTree = (function () {
    function BinarySearchTree(value) {
        _classCallCheck(this, BinarySearchTree);

        this._data = value;
        this._left = null;
        this._right = null;
    }

    //     private static BinarySearchTree Add(int value, BinarySearchTree tree)
    //     {
    //         if (tree == null)
    //         {
    //             return new BinarySearchTree(value);
    //         }

    //         return tree.Add(value);
    //     }

    //     public IEnumerator<int> GetEnumerator()
    //     {
    //         foreach (var left in Left?.AsEnumerable() ?? Enumerable.Empty<int>())
    //         {
    //             yield return left;
    //         }

    //         yield return Value;

    //         foreach (var right in Right?.AsEnumerable() ?? Enumerable.Empty<int>())
    //         {
    //             yield return right;
    //         }
    //     }

    //     IEnumerator IEnumerable.GetEnumerator()
    //     {
    //         return GetEnumerator();
    //     }
    // }

    _createClass(BinarySearchTree, [{
        key: "insert",
        value: function insert(value) {
            if (value <= this.data) this._left = this.insertIntoTree(value, this._left);else this._right = this.insertIntoTree(value, this._right);
        }
    }, {
        key: "insertIntoTree",
        value: function insertIntoTree(value, tree) {
            if (tree === null) return new BinarySearchTree(value);

            tree.insert(value);
            return tree;
        }
    }, {
        key: "each",
        value: function each(callback) {
            if (this.left) this.left.each(callback);

            callback(this.data);

            if (this.right) this.right.each(callback);
        }
    }, {
        key: "data",
        get: function get() {
            return this._data;
        }
    }, {
        key: "left",
        get: function get() {
            return this._left;
        }
    }, {
        key: "right",
        get: function get() {
            return this._right;
        }
    }]);

    return BinarySearchTree;
})();

exports["default"] = BinarySearchTree;
module.exports = exports["default"];
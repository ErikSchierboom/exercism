export default class BinarySearchTree {
    constructor(value) {
        this._data = value;
        this._left = null;
        this._right = null;
    } 

    get data() {
        return this._data;
    }

    get left() {
        return this._left;
    }

    get right() {
        return this._right;
    }

    insert(value) {
        if (value <= this.data)
            this._left = this.insertIntoTree(value, this._left);
        else
            this._right = this.insertIntoTree(value, this._right);
    }

    insertIntoTree(value, tree) {
        if (tree === null)
            return new BinarySearchTree(value);

        tree.insert(value);
        return tree;
    }

    each(callback) {
        if (this.left)
            this.left.each(callback);

        callback(this.data);

        if (this.right)
            this.right.each(callback);
    }
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
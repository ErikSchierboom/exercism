class TreeCrumb {
  constructor(value, tree) {
    this.value = value;
    this.tree = tree;
  }
}

class LeftCrumb extends TreeCrumb {
  constructor(value, tree) {
    super(value, tree);
  }
}

class RightCrumb extends TreeCrumb {
  constructor(value, tree) {
    super(value, tree);
  }
}

export default class Zipper {
  constructor(value, left, right, crumbs) {
    this._value = value;
    this._left = left;
    this._right = right;
    this._crumbs = crumbs;
  }

  value() {
    return this._value;
  }

  left() {
    if (this._left == null) return null;

    const newCrumbs = [new LeftCrumb(this._value, this._right)].concat(
      this._crumbs
    );
    return new Zipper(
      this._left.value,
      this._left.left,
      this._left.right,
      newCrumbs
    );
  }

  right() {
    if (this._right == null) return null;

    const newCrumbs = [new RightCrumb(this._value, this._left)].concat(
      this._crumbs
    );
    return new Zipper(
      this._right.value,
      this._right.left,
      this._right.right,
      newCrumbs
    );
  }

  setValue(newValue) {
    return new Zipper(newValue, this._left, this._right, this._crumbs);
  }

  setLeft(binTree) {
    return new Zipper(this._value, binTree, this._right, this._crumbs);
  }

  setRight(binTree) {
    return new Zipper(this._value, this._left, binTree, this._crumbs);
  }

  up() {
    if (this._crumbs.Count == 0) return null;

    const firstCrumb = this._crumbs[0];
    const remainingCrumbs = this._crumbs.slice(1);

    if (firstCrumb instanceof LeftCrumb)
      return new Zipper(
        firstCrumb.value,
        Zipper.createTree(this._value, this._left, this._right),
        firstCrumb.tree,
        remainingCrumbs
      );

    if (firstCrumb instanceof RightCrumb)
      return new Zipper(
        firstCrumb.value,
        firstCrumb.tree,
        Zipper.createTree(this._value, this._left, this._right),
        remainingCrumbs
      );

    return null;
  }

  toTree() {
    let tree = Zipper.createTree(this._value, this._left, this._right);

    for (const crumb of this._crumbs) {
      if (crumb instanceof LeftCrumb)
        tree = Zipper.createTree(
          crumb.value,
          Zipper.createTree(tree.value, tree.left, tree.right),
          crumb.tree
        );
      if (crumb instanceof RightCrumb)
        tree = Zipper.createTree(
          crumb.value,
          crumb.tree,
          Zipper.createTree(tree.value, tree.left, tree.right)
        );
    }

    return tree;
  }

  static fromTree(tree) {
    return new Zipper(tree.value, tree.left, tree.right, []);
  }

  static createTree(value, left, right) {
    return {
      value: value,
      left: left || null,
      right: right || null
    };
  }
}

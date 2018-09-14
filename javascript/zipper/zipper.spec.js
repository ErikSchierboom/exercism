import Zipper  from './zipper';

// Tests adapted from `problem-specifications/zipper/canonical-data.json` @ v1.0.0

function bt(value, left, right) {
  return {
    value: value,
    left: left,
    right: right
  };
}

function leaf(value) {
  return bt(value, null, null);
}

describe('Zipper', () => {
  const t1 = bt(1, bt(2, null, leaf(3)), leaf(4));
  const t2 = bt(1, bt(5, null, leaf(3)), leaf(4));
  const t3 = bt(1, bt(2, leaf(5), leaf(3)), leaf(4));
  const t4 = bt(1, leaf(2), leaf(4));
  const t5 = bt(1, bt(2, null, leaf(3)), bt(6, leaf(7), leaf(8)));
  const t6 = bt(1, bt(2, null, leaf(5)), leaf(4));
  let zipper;

  beforeEach(() => {
    zipper = Zipper.fromTree(t1);
  });

  test('data is retained', () => {
    expect(zipper.toTree()).toEqual(t1);
  });

  xtest('left, right and value', () => {
    expect(zipper.left().right().value()).toEqual(3);
  });

  xtest('dead end', () => {
    expect(zipper.left().left()).toBe(null);
  });

  xtest('tree from deep focus', () => {
    expect(zipper.left().right().toTree()).toEqual(t1);
  });

  xtest('traversing up from top', () => {
    expect(zipper.up()).toEqual(null);
  });

  xtest('left, right and up', () => {
    expect(zipper.left().up().right().up().left().right().value()).toEqual(3);
  });

  xtest('setValue', () => {
    expect(zipper.left().setValue(5).toTree()).toEqual(t2);
  });

  xtest('setValue after traversing up', () => {
    expect(zipper.left().right().up().setValue(5).toTree()).toEqual(t2);
  });

  xtest('setLeft with leaf', () => {
    expect(zipper.left().setLeft(leaf(5)).toTree()).toEqual(t3);
  });

  xtest('setRight with null', () => {
    expect(zipper.left().setRight(null).toTree()).toEqual(t4);
  });

  xtest('setRight with subtree', () => {
    expect(zipper.setRight(bt(6, leaf(7), leaf(8))).toTree()).toEqual(t5);
  });

  xtest('setValue on deep focus', () => {
    expect(zipper.left().right().setValue(5).toTree()).toEqual(t6);
  });
});

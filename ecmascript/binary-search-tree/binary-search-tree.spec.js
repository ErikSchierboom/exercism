import BinarySearchTree from './binary-search-tree';

function recordAllData(bst) {
  let out = [];

  bst.each((data) => out.push(data));

  return out;
}

describe('BinarySearchTree', () => {

  it('data is retained', () => {
    expect(new BinarySearchTree(4).data).toEqual(4);
  });

  it('inserting less', () => {
    let four = new BinarySearchTree(4);
    four.insert(2);

    expect(four.data).toEqual(4);
    expect(four.left.data).toEqual(2);
  });

  it('inserting same', () => {
    let four = new BinarySearchTree(4);
    four.insert(4);

    expect(four.data).toEqual(4);
    expect(four.left.data).toEqual(4);
  });

  it('inserting right', () => {
    let four = new BinarySearchTree(4);
    four.insert(5);

    expect(four.data).toEqual(4);
    expect(four.right.data).toEqual(5);
  });

  it('complex tree', () => {
    let four = new BinarySearchTree(4);
    four.insert(2);
    four.insert(6);
    four.insert(1);
    four.insert(3);
    four.insert(7);
    four.insert(5);

    expect(four.data).toEqual(4);
    expect(four.left.data).toEqual(2);
    expect(four.left.left.data).toEqual(1);
    expect(four.left.right.data).toEqual(3);
    expect(four.right.data).toEqual(6);
    expect(four.right.left.data).toEqual(5);
    expect(four.right.right.data).toEqual(7);
  });

  it('iterating one element', () => {
    expect(recordAllData(new BinarySearchTree(4))).toEqual([ 4 ]);
  });

  it('iterating over smaller element', () => {
    let four = new BinarySearchTree(4);
    four.insert(2);

    expect(recordAllData(four)).toEqual([ 2, 4 ]);
  });

  it('iterating over larger element', () => {
    let four = new BinarySearchTree(4);
    four.insert(5);

    expect(recordAllData(four)).toEqual([ 4, 5 ]);
  });

  it('iterating over complex tree', () => {
    let four = new BinarySearchTree(4);
    four.insert(2);
    four.insert(1);
    four.insert(3);
    four.insert(6);
    four.insert(7);
    four.insert(5);

    expect(recordAllData(four)).toEqual([ 1, 2, 3, 4, 5, 6, 7 ]);
  });

});

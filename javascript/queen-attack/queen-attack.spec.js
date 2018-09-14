import Queens from './queen-attack';

describe('Queens', () => {
  test('has the correct default positions', () => {
    const queens = new Queens();
    expect(queens.white).toEqual([0, 3]);
    expect(queens.black).toEqual([7, 3]);
  });

  xtest('initialized with specific placement', () => {
    const queens = new Queens({ white: [3, 7], black: [6, 1] });
    expect(queens.white).toEqual([3, 7]);
    expect(queens.black).toEqual([6, 1]);
  });

  xtest('cannot occupy the same space', () => {
    const positioning = { white: [2, 4], black: [2, 4] };
    const expectedError = 'Queens cannot share the same space';
    expect(() => new Queens(positioning)).toThrow(expectedError);
  });

  xtest('toString representation', () => {
    const positioning = { white: [2, 4], black: [6, 6] };
    const queens = new Queens(positioning);
    const board = ['_ _ _ _ _ _ _ _',
      '_ _ _ _ _ _ _ _',
      '_ _ _ _ W _ _ _',
      '_ _ _ _ _ _ _ _',
      '_ _ _ _ _ _ _ _',
      '_ _ _ _ _ _ _ _',
      '_ _ _ _ _ _ B _',
      '_ _ _ _ _ _ _ _\n'].join('\n');
    expect(queens.toString()).toEqual(board);
  });

  xtest('queens cannot attack', () => {
    const queens = new Queens({ white: [2, 3], black: [4, 7] });
    expect(queens.canAttack()).toEqual(false);
  });

  xtest('queens can attack when they are on the same row', () => {
    const queens = new Queens({ white: [2, 4], black: [2, 7] });
    expect(queens.canAttack()).toEqual(true);
  });

  xtest('queens can attack when they are on the same column', () => {
    const queens = new Queens({ white: [5, 4], black: [2, 4] });
    expect(queens.canAttack()).toEqual(true);
  });

  xtest('queens can attack diagonally', () => {
    const queens = new Queens({ white: [1, 1], black: [6, 6] });
    expect(queens.canAttack()).toEqual(true);
  });

  xtest('queens can attack another diagonally', () => {
    const queens = new Queens({ white: [0, 6], black: [1, 7] });
    expect(queens.canAttack()).toEqual(true);
  });

  xtest('queens can attack yet another diagonally', () => {
    const queens = new Queens({ white: [4, 1], black: [6, 3] });
    expect(queens.canAttack()).toEqual(true);
  });

  xtest('queens can attack on a north-east/south-west diagonal', () => {
    const queens = new Queens({ white: [7, 0], black: [0, 7] });
    expect(queens.canAttack()).toEqual(true);
  });

  xtest('queens can attack on another ne/sw diagonal', () => {
    const queens = new Queens({ white: [2, 6], black: [5, 3] });
    expect(queens.canAttack()).toEqual(true);
  });
});

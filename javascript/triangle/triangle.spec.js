import Triangle from './triangle';

describe('Triangle', () => {
  test('equilateral triangles have equal sides', () => {
    const triangle = new Triangle(2, 2, 2);
    expect(triangle.kind()).toEqual('equilateral');
  });

  test('larger equilateral triangles also have equal sides', () => {
    const triangle = new Triangle(10, 10, 10);
    expect(triangle.kind()).toEqual('equilateral');
  });

  test('isosceles triangles have last two sides equal', () => {
    const triangle = new Triangle(3, 4, 4);
    expect(triangle.kind()).toEqual('isosceles');
  });

  test('isosceles trianges have first and last sides equal', () => {
    const triangle = new Triangle(4, 3, 4);
    expect(triangle.kind()).toEqual('isosceles');
  });

  test('isosceles triangles have two first sides equal', () => {
    const triangle = new Triangle(4, 4, 3);
    expect(triangle.kind()).toEqual('isosceles');
  });

  test('isosceles triangles have in fact exactly two sides equal', () => {
    const triangle = new Triangle(10, 10, 2);
    expect(triangle.kind()).toEqual('isosceles');
  });

  test('scalene triangles have no equal sides', () => {
    const triangle = new Triangle(3, 4, 5);
    expect(triangle.kind()).toEqual('scalene');
  });

  test('scalene triangles have no equal sides at a larger scale too', () => {
    const triangle = new Triangle(10, 11, 12);
    expect(triangle.kind()).toEqual('scalene');
  });

  test('scalene triangles have no equal sides in descending order either', () => {
    const triangle = new Triangle(5, 4, 2);
    expect(triangle.kind()).toEqual('scalene');
  });

  test('very small triangles are legal', () => {
    const triangle = new Triangle(0.4, 0.6, 0.3);
    expect(triangle.kind()).toEqual('scalene');
  });

  test('test triangles with no size are illegal', () => {
    const triangle = new Triangle(0, 0, 0);
    expect(triangle.kind.bind(triangle)).toThrow();
  });

  test('triangles with negative sides are illegal', () => {
    const triangle = new Triangle(3, 4, -5);
    expect(triangle.kind.bind(triangle)).toThrow();
  });

  test('triangles violating triangle inequality are illegal', () => {
    const triangle = new Triangle(1, 1, 3);
    expect(triangle.kind.bind(triangle)).toThrow();
  });

  test('triangles violating triangle inequality are illegal 2', () => {
    const triangle = new Triangle(7, 3, 2);
    expect(triangle.kind.bind(triangle)).toThrow();
  });

  test('triangles violating triangle inequality are illegal 3', () => {
    const triangle = new Triangle(10, 1, 3);
    expect(triangle.kind.bind(triangle)).toThrow();
  });
});

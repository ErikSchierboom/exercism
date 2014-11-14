var Example = require('./example.js');

describe("Example", function() {
  var example = new Example();

  it("add 2 and 2", function () {
    var result = example.add(2, 2);
    expect(result).toEqual(4);
  });

  it("add 12 and 24", function () {
    var result = example.add(12, 24);
    expect(result).toEqual(36);
  });

  it("add 100 and 1", function () {
    var result = example.add(100, 1);
    expect(result).toEqual(101);
  });

  return it("add 2 and -2", function () {
    var result = example.add(2, -2);
    expect(result).toEqual(0);
  });
});

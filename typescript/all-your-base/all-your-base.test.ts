import { convert } from "./all-your-base";

describe("Converter", () => {
  it("single bit one to decimal", () => {
    expect(convert([1], 2, 10)).toEqual([1]);
  });

  it("binary to single decimal", () => {
    expect(convert([1, 0, 1], 2, 10)).toEqual([5]);
  });

  it("single decimal to binary", () => {
    expect(convert([5], 10, 2)).toEqual([1, 0, 1]);
  });

  it("binary to multiple decimal", () => {
    expect(convert([1, 0, 1, 0, 1, 0], 2, 10)).toEqual([4, 2]);
  });

  it("decimal to binary", () => {
    expect(convert([4, 2], 10, 2)).toEqual([1, 0, 1, 0, 1, 0]);
  });

  it("trinary to hexadecimal", () => {
    expect(convert([1, 1, 2, 0], 3, 16)).toEqual([2, 10]);
  });

  it("hexadecimal to trinary", () => {
    expect(convert([2, 10], 16, 3)).toEqual([1, 1, 2, 0]);
  });

  it("15-bit integer", () => {
    expect(convert([3, 46, 60], 97, 73)).toEqual([6, 10, 45]);
  });

  it("empty list", () => {
    expect(() => {
      convert([], 2, 10);
    }).toThrowError("Input has wrong format");
  });

  it("single zero", () => {
    expect(convert([0], 10, 2)).toEqual([0]);
  });

  it("multiple zeros", () => {
    expect(() => {
      convert([0, 0, 0], 10, 2);
    }).toThrowError("Input has wrong format");
  });

  it("leading zeros", () => {
    expect(() => {
      convert([0, 6, 0], 7, 10);
    }).toThrowError("Input has wrong format");
  });

  it("negative digit", () => {
    expect(() => {
      convert([1, -1, 1, 0, 1, 0], 2, 10);
    }).toThrowError("Input has wrong format");
  });

  it("invalid positive digit", () => {
    expect(() => {
      convert([1, 2, 1, 0, 1, 0], 2, 10);
    }).toThrowError("Input has wrong format");
  });

  it("first base is one", () => {
    expect(() => {
      convert([], 1, 10);
    }).toThrowError("Wrong input base");
  });

  it("second base is one", () => {
    expect(() => {
      convert([1, 0, 1, 0, 1, 0], 2, 1);
    }).toThrowError("Wrong output base");
  });

  it("first base is zero", () => {
    expect(() => {
      convert([], 0, 10);
    }).toThrowError("Wrong input base");
  });

  it("second base is zero", () => {
    expect(() => {
      convert([7], 10, 0);
    }).toThrowError("Wrong output base");
  });

  it("first base is negative", () => {
    expect(() => {
      convert([1], -2, 10);
    }).toThrowError("Wrong input base");
  });

  it("second base is negative", () => {
    expect(() => {
      convert([1], 2, -7);
    }).toThrowError("Wrong output base");
  });

  it("both bases are negative", () => {
    expect(() => {
      convert([1], -2, -7);
    }).toThrowError("Wrong input base");
  });

  it("wrong output_base base not integer", () => {
    expect(() => {
      convert([0], 3, 2.5);
    }).toThrowError("Wrong output base");
  });
});

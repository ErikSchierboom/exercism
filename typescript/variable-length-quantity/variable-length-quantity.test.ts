import { encode, decode } from "./variable-length-quantity";

describe("VariableLengthQuantity", () => {
  describe("Encode a series of integers, producing a series of bytes.", () => {
    it("zero", () => {
      expect(encode([0])).toEqual([0]);
    });

    it("arbitrary single byte", () => {
      expect(encode([0x40])).toEqual([0x40]);
    });

    it("largest single byte", () => {
      expect(encode([0x7f])).toEqual([0x7f]);
    });

    it("smallest double byte", () => {
      expect(encode([0x80])).toEqual([0x81, 0]);
    });

    it("arbitrary double byte", () => {
      expect(encode([0x2000])).toEqual([0xc0, 0]);
    });

    it("largest double byte", () => {
      expect(encode([0x3fff])).toEqual([0xff, 0x7f]);
    });

    it("smallest triple byte", () => {
      expect(encode([0x4000])).toEqual([0x81, 0x80, 0]);
    });

    it("arbitrary triple byte", () => {
      expect(encode([0x100000])).toEqual([0xc0, 0x80, 0]);
    });

    it("largest triple byte", () => {
      expect(encode([0x1fffff])).toEqual([0xff, 0xff, 0x7f]);
    });

    it("smallest quadruple byte", () => {
      expect(encode([0x200000])).toEqual([0x81, 0x80, 0x80, 0]);
    });

    it("arbitrary quadruple byte", () => {
      expect(encode([0x8000000])).toEqual([0xc0, 0x80, 0x80, 0]);
    });

    it("largest quadruple byte", () => {
      expect(encode([0xfffffff])).toEqual([0xff, 0xff, 0xff, 0x7f]);
    });

    it("smallest quintuple byte", () => {
      expect(encode([0x10000000])).toEqual([0x81, 0x80, 0x80, 0x80, 0]);
    });

    it("arbitrary quintuple byte", () => {
      expect(encode([0xff000000])).toEqual([0x8f, 0xf8, 0x80, 0x80, 0]);
    });

    it("maximum 32-bit integer input", () => {
      expect(encode([0xffffffff])).toEqual([0x8f, 0xff, 0xff, 0xff, 0x7f]);
    });

    it("two single-byte values", () => {
      expect(encode([0x40, 0x7f])).toEqual([0x40, 0x7f]);
    });

    it("two multi-byte values", () => {
      expect(encode([0x4000, 0x123456])).toEqual([
        0x81, 0x80, 0, 0xc8, 0xe8, 0x56,
      ]);
    });

    it("many multi-byte values", () => {
      const input = [0x2000, 0x123456, 0xfffffff, 0, 0x3fff, 0x4000];
      const expected = [
        0xc0, 0, 0xc8, 0xe8, 0x56, 0xff, 0xff, 0xff, 0x7f, 0, 0xff, 0x7f, 0x81,
        0x80, 0,
      ];
      expect(encode(input)).toEqual(expected);
    });
  });

  describe("Decode a series of bytes, producing a series of integers.", () => {
    it("one byte", () => {
      expect(decode([0x7f])).toEqual([0x7f]);
    });

    it("two bytes", () => {
      expect(decode([0xc0, 0])).toEqual([0x2000]);
    });

    it("three bytes", () => {
      expect(decode([0xff, 0xff, 0x7f])).toEqual([0x1fffff]);
    });

    it("four bytes", () => {
      expect(decode([0x81, 0x80, 0x80, 0])).toEqual([0x200000]);
    });

    it("maximum 32-bit integer", () => {
      expect(decode([0x8f, 0xff, 0xff, 0xff, 0x7f])).toEqual([0xffffffff]);
    });

    it("incomplete sequence causes error", () => {
      expect(() => {
        decode([0xff]);
      }).toThrowError("Incomplete sequence");
    });

    it("incomplete sequence causes error, even if value is zero", () => {
      expect(() => {
        decode([0x80]);
      }).toThrowError("Incomplete sequence");
    });

    it("multiple values", () => {
      const input = [
        0xc0, 0, 0xc8, 0xe8, 0x56, 0xff, 0xff, 0xff, 0x7f, 0, 0xff, 0x7f, 0x81,
        0x80, 0,
      ];
      const expected = [0x2000, 0x123456, 0xfffffff, 0, 0x3fff, 0x4000];
      expect(decode(input)).toEqual(expected);
    });
  });
});

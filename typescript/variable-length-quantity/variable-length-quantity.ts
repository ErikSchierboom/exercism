export default class VLQ {
  private static readonly SevenBitsMask = 0x7f;
  private static readonly EightBitMask = 0x80;

  public static encode(integers: number[]): number[] {
    const encodedBytes: number[] = [];
    integers.forEach(integer =>
      encodedBytes.push(...VLQ.encodeInteger(integer))
    );

    return encodedBytes;
  }

  private static encodeInteger(integer: number): number[] {
    if (integer == 0) {
      return [0];
    }

    let bytes = [];

    while (integer > 0) {
      var tmp = integer & VLQ.SevenBitsMask;
      integer >>>= 7;

      if (bytes.length > 0) {
        tmp |= VLQ.EightBitMask;
      }

      bytes.push(tmp);
    }

    bytes.reverse();
    return bytes;
  }

  public static decode(encodedBytes: number[]): number[] {
    const decodedIntegers: number[] = [];
    let tmp = 0;
    for (let index = 0; index < encodedBytes.length; index++) {
      if ((tmp & 0xfe000000) > 0) {
        throw new Error("Overflow exception.");
      }
      const b = encodedBytes[index];
      tmp = (tmp << 7) | (b & 0x7f);
      if ((b & 0x80) == 0) {
        decodedIntegers.push(tmp >>> 0);
        tmp = 0;
      } else if (index == encodedBytes.length - 1) {
        throw new Error("Incomplete sequence.");
      }
    }
    return decodedIntegers;
  }
}

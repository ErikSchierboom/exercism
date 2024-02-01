// Adapted from: https://medium.com/@tomas.langkaas/eight-algorithms-for-roman-numerals-b06c83db12dd
//
// Roman numerals can be written in mixed radius (alternating between 5 and 2)
// 753 = 1₍₂₎2₍₅₎1₍₂₎0₍₅₎0₍₂₎3₍₅₎
//     = 1D + 2C + 1L + 0X + 0V + 3I
//     = DCCLIII

const letters = "MDCLXVI";

export function toRoman(num) {
  let index = 0,
    result = "",
    value = 1000,
    radix = 2,
    subtractValue = 0;

  while (num > 0) {
    while (num >= value) {
      result += letters[index];
      num -= value;
    }

    if (radix == 2) {
      subtractValue = value / 10;
    }

    if (num + subtractValue >= value) {
      result += letters[index + 1 + (radix == 2)];
      num += subtractValue;
    } else {
      index++;
      value /= radix;
      radix ^= 7;
    }
  }

  return result;
}

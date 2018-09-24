export function steps(number) {
  if (number <= 0) {
    throw "Only positive numbers are allowed";
  }

  let stepCount = 0;
  let remainder = number;

  while (remainder !== 1) {
    remainder = remainder % 2 == 0 ? remainder / 2 : remainder * 3 + 1;
    stepCount++;
  }

  return stepCount;
}

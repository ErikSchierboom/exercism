export function solve(x, y) {
  if (typeof x !== "number" || typeof y !== "number") {
    return null;
  }

  const distance = Math.sqrt(x ** 2 + y ** 2);

  if (distance <= 1.0) {
    return 10;
  } else if (distance <= 5.0) {
    return 5;
  } else if (distance <= 10.0) {
    return 1;
  } else {
    return 0;
  }
}

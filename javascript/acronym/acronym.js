export const parse = (sentence) =>
  sentence
    .match(/[A-Za-z']+/g)
    .map((x) => x[0].toUpperCase())
    .join("");

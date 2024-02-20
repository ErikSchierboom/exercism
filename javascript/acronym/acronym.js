export const parse = (sentence) =>
  sentence
    .toUpperCase()
    .match(/[A-Z']+/g)
    .map((x) => x[0])
    .join("");

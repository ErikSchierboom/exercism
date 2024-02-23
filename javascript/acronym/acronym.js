export const parse = (sentence) =>
  sentence
    .toUpperCase()
    .match(/[a-z']+/gi)
    .map((x) => x[0])
    .join("");

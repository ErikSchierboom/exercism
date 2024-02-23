export const parse = (sentence) =>
  sentence
    .match(/[a-z']+/gi)
    .map((x) => x[0].toUpperCase())
    .join("");

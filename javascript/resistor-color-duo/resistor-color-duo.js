const COLORS = [
  "black",
  "brown",
  "red",
  "orange",
  "yellow",
  "green",
  "blue",
  "violet",
  "grey",
  "white"
];

export const value = colors =>
  colors.reduce((acc, color) => acc * 10 + COLORS.indexOf(color), 0);

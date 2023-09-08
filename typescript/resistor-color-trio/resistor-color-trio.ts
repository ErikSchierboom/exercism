const Colors = [
  "black",
  "brown",
  "red",
  "orange",
  "yellow",
  "green",
  "blue",
  "violet",
  "grey",
  "white",
];

const PREFIXES = [
  { base: 1_000_000_000, prefix: "giga" },
  { base: 1_000_000, prefix: "mega" },
  { base: 1_000, prefix: "kilo" },
];

export function decodedResistorValue(colors: string[]): string {
  const decodedOhms =
    (Colors.indexOf(colors[0]) * 10 + Colors.indexOf(colors[1])) *
    Math.pow(10, Colors.indexOf(colors[2]));

  const encoding = PREFIXES.find((ohm) => ohm.base <= decodedOhms);
  const base = encoding?.base || 1;
  const prefix = encoding?.prefix || "";
  return `${decodedOhms / base} ${prefix}ohms`;
}

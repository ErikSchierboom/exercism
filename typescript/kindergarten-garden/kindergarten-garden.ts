const defaultChildren = [
  "Alice",
  "Bob",
  "Charlie",
  "David",
  "Eve",
  "Fred",
  "Ginny",
  "Harriet",
  "Ileana",
  "Joseph",
  "Kincaid",
  "Larry"
];

function plantCodeToPlant(code: string): string {
  switch (code) {
    case "V":
      return "violets";
    case "R":
      return "radishes";
    case "G":
      return "grass";
    case "C":
      return "clover";
    default:
      throw new Error("Unknown plant code");
  }
}

function plantsForChildIndex(
  childIndex: number,
  windowSills: string[]
): string[] {
  const column = childIndex * 2;

  if (column >= windowSills[0].length) {
    return [];
  }

  return [
    plantCodeToPlant(windowSills[0][column]),
    plantCodeToPlant(windowSills[0][column + 1]),
    plantCodeToPlant(windowSills[1][column]),
    plantCodeToPlant(windowSills[1][column + 1])
  ];
}

export interface StudentPlants {
  [key: string]: string[];
}

export default class Garden implements StudentPlants {
  [key: string]: string[];

  constructor(
    combinedWindowsSills: string,
    children: string[] = defaultChildren
  ) {
    children.sort();

    const windowSills = combinedWindowsSills.split("\n");

    for (let i = 0; i < children.length; i++) {
      this[children[i].toLowerCase()] = plantsForChildIndex(i, windowSills);
    }
  }
}

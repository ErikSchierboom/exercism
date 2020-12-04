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

export class ResistorColor {
  private colors: string[];

  constructor(colors: string[]) {
    if (colors.length < 2) {
      throw new Error("At least two colors need to be present");
    }

    this.colors = colors;
  }
  value = (): number =>
    Colors.indexOf(this.colors[0]) * 10 + Colors.indexOf(this.colors[1]);
}

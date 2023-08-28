class Team {
  public wins = 0;
  public draws = 0;
  public losses = 0;

  constructor(public name: string) {}

  get played(): number {
    return this.wins + this.draws + this.losses;
  }

  get points(): number {
    return this.wins * 3 + this.draws;
  }
}

class Report {
  private lines: string[] = [];

  constructor() {
    this.addRow("Team", "MP", "W", "D", "L", "P");
  }

  public addRow(
    name: string,
    played: string,
    wins: string,
    draws: string,
    losses: string,
    points: string
  ): void {
    this.lines.push(
      [
        name.padEnd(30),
        played.padStart(2),
        wins.padStart(2),
        draws.padStart(2),
        losses.padStart(2),
        points.padStart(2),
      ].join(" | ")
    );
  }

  public toString(): string {
    return this.lines.join("\n");
  }
}

export class Tournament {
  private teams: { [name: string]: Team } = {};

  public tally(input: string): string {
    this.importScores(input);

    const report = new Report();

    for (const team of Object.values(this.teams).sort(
      (a, b) => b.points - a.points || a.name.localeCompare(b.name)
    )) {
      report.addRow(
        team.name,
        team.played.toString(),
        team.wins.toString(),
        team.draws.toString(),
        team.losses.toString(),
        team.points.toString()
      );
    }

    return report.toString();
  }

  private importScores(input: string): void {
    for (const line of input.split("\n").filter((s) => s.length > 0)) {
      const [home, away, result] = line.split(";");

      this.teams[home] ||= new Team(home);
      this.teams[away] ||= new Team(away);

      switch (result) {
        case "win":
          this.teams[home].wins++;
          this.teams[away].losses++;
          break;
        case "draw":
          this.teams[home].draws++;
          this.teams[away].draws++;
          break;
        case "loss":
          this.teams[home].losses++;
          this.teams[away].wins++;
          break;
      }
    }
  }
}

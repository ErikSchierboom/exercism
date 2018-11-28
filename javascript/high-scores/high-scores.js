export class HighScores {
  constructor(input) {
    this.scores = input;
  }

  get latest() {
    return this.scores[this.scores.length - 1];
  }

  get highest() {
    return Math.max(...this.scores);
  }

  get top() {
    return this.scores.sort((a, b) => b - a).slice(0, 3);
  }

  get report() {
    const latestReport = `Your latest score was ${this.latest}.`;

    const difference = this.highest - this.latest;
    const personalBestReport =
      difference === 0
        ? "That's your personal best!"
        : `That's ${difference} short of your personal best!`;

    return `${latestReport} ${personalBestReport}`;
  }
}

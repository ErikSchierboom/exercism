const numberOfFrames = 10;
const maximumFrameScore = 10;

export default class Bowling {
  private rolls: number[];

  constructor(rolls: number[]) {
    this.rolls = rolls;
  }

  public score(): number {
    let score = 0;
    let frameIndex = 0;
    let hasBonusRolls = false;

    for (let frame = 0; frame < numberOfFrames; frame++) {
      if (this.gameNotFinished(frameIndex)) {
        throw "Score cannot be taken until the end of the game";
      } else if (this.invalidNumberOfPins(frame)) {
        throw "Pins must have a value from 0 to 10";
      } else if (this.invalidNumberOfPinsInFrame(frameIndex, frame)) {
        throw "Pin count exceeds pins on the lane";
      } else if (this.isStrike(frameIndex)) {
        score += 10 + this.strikeBonus(frameIndex);
        frameIndex += 1;
        hasBonusRolls = this.isLastFrame(frame);
      } else if (this.isSpare(frameIndex)) {
        score += 10 + this.spareBonus(frameIndex);
        frameIndex += 2;
        hasBonusRolls = this.isLastFrame(frame);
      } else {
        score += this.sumOfPinsInFrame(frameIndex);
        frameIndex += 2;
      }
    }

    if (this.hasRollsAfterGameHasFinished(hasBonusRolls, frameIndex)) {
      throw "Should not be able to roll after game is over";
    }

    if (this.bonusRollsNotFinished(score)) {
      throw "Score cannot be taken until the end of the game";
    }

    return score;
  }

  private hasRollsAfterGameHasFinished(
    hasBonusRolls: boolean,
    frameIndex: number
  ) {
    return !hasBonusRolls && this.rolls.length > frameIndex;
  }

  private bonusRollsNotFinished(score: number) {
    return Number.isNaN(score);
  }

  private gameNotFinished(frameIndex: number) {
    return frameIndex >= this.rolls.length;
  }

  private invalidNumberOfPinsInFrame(frameIndex: number, frame: number): any {
    if (this.isStrike(frameIndex)) {
      return this.invalidNumberOfPinsInStrikeFrame(frameIndex, frame);
    }

    return this.sumOfPinsInFrame(frameIndex) > maximumFrameScore;
  }

  private invalidNumberOfPinsInStrikeFrame(frameIndex: number, frame: number) {
    if (!this.isLastFrame(frame)) {
      return false;
    }

    if (!this.isStrike(frameIndex + 1) && this.isStrike(frameIndex + 2)) {
      return true;
    }

    if (this.isStrike(frameIndex + 1) || this.isStrike(frameIndex + 2)) {
      return this.sumOfPinsInFrame(frameIndex + 1) > maximumFrameScore * 2;
    }

    return this.sumOfPinsInFrame(frameIndex + 1) > maximumFrameScore;
  }

  private isLastFrame(frame: number) {
    return frame == numberOfFrames - 1;
  }

  private invalidNumberOfPins(i: number) {
    return this.rolls[i] < 0 || this.rolls[i] > maximumFrameScore;
  }

  private isStrike(frameIndex: number): boolean {
    return this.rolls[frameIndex] === maximumFrameScore;
  }

  private isSpare(frameIndex: number): boolean {
    return (
      this.rolls[frameIndex] + this.rolls[frameIndex + 1] === maximumFrameScore
    );
  }

  private strikeBonus(frameIndex: number): number {
    return this.rolls[frameIndex + 1] + this.rolls[frameIndex + 2];
  }

  private spareBonus(frameIndex: number): number {
    return this.rolls[frameIndex + 2];
  }

  private sumOfPinsInFrame(frameIndex: number): number {
    return this.rolls[frameIndex] + this.rolls[frameIndex + 1];
  }
}

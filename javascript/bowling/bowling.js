const numberOfFrames = 10;
const maximumFrameScore = 10;

export default class Bowling {
  constructor(rolls) {
    this.rolls = rolls;
  }

  score() {
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

  hasRollsAfterGameHasFinished(hasBonusRolls, frameIndex) {
    return !hasBonusRolls && this.rolls.length > frameIndex;
  }

  bonusRollsNotFinished(score) {
    return Number.isNaN(score);
  }

  gameNotFinished(frameIndex) {
    return frameIndex >= this.rolls.length;
  }

  invalidNumberOfPinsInFrame(frameIndex, frame) {
    if (this.isStrike(frameIndex)) {
      return this.invalidNumberOfPinsInStrikeFrame(frameIndex, frame);
    }

    return this.sumOfPinsInFrame(frameIndex) > maximumFrameScore;
  }

  invalidNumberOfPinsInStrikeFrame(frameIndex, frame) {
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

  isLastFrame(frame) {
    return frame == numberOfFrames - 1;
  }

  invalidNumberOfPins(i) {
    return this.rolls[i] < 0 || this.rolls[i] > maximumFrameScore;
  }

  isStrike(frameIndex) {
    return this.rolls[frameIndex] === maximumFrameScore;
  }

  isSpare(frameIndex) {
    return (
      this.rolls[frameIndex] + this.rolls[frameIndex + 1] === maximumFrameScore
    );
  }

  strikeBonus(frameIndex) {
    return this.rolls[frameIndex + 1] + this.rolls[frameIndex + 2];
  }

  spareBonus(frameIndex) {
    return this.rolls[frameIndex + 2];
  }

  sumOfPinsInFrame(frameIndex) {
    return this.rolls[frameIndex] + this.rolls[frameIndex + 1];
  }
}

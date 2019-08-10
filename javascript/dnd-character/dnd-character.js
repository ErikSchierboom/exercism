export const abilityModifier = score => {
  if (score < 3) {
    throw new Error("Ability scores must be at least 3");
  }

  if (score > 18) {
    throw new Error("Ability scores can be at most 18");
  }

  return Math.floor((score - 10) / 2.0);
};

const rollDie = () => Math.floor(Math.random() * 5.0) + 1.0;

export class Character {
  static rollAbility() {
    const rolls = [rollDie(), rollDie(), rollDie(), rollDie()];
    return rolls
      .sort()
      .slice(1)
      .reduce((acc, score) => acc + score);
  }

  constructor() {
    this._strength = Character.rollAbility();
    this._dexterity = Character.rollAbility();
    this._constitution = Character.rollAbility();
    this._intelligence = Character.rollAbility();
    this._wisdom = Character.rollAbility();
    this._charisma = Character.rollAbility();
    this._hitpoints = 10 + abilityModifier(this.constitution);
  }

  get strength() {
    return this._strength;
  }

  get dexterity() {
    return this._dexterity;
  }

  get constitution() {
    return this._constitution;
  }

  get intelligence() {
    return this._intelligence;
  }

  get wisdom() {
    return this._wisdom;
  }

  get charisma() {
    return this._charisma;
  }

  get hitpoints() {
    return this._hitpoints;
  }
}

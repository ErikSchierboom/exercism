import { proverb } from "./proverb";

describe("Proverb", () => {
  it("a single consequence", () => {
    const expected = `For want of a nail the shoe was lost.\nAnd all for the want of a nail.`;
    expect(proverb("nail", "shoe")).toEqual(expected);
  });

  it("a short chain of consequences", () => {
    const expected = `For want of a nail the shoe was lost.\nFor want of a shoe the horse was lost.\nAnd all for the want of a nail.`;
    expect(proverb("nail", "shoe", "horse")).toEqual(expected);
  });

  it("a longer chain of consequences", () => {
    const expected = `For want of a nail the shoe was lost.\nFor want of a shoe the horse was lost.\nFor want of a horse the rider was lost.\nAnd all for the want of a nail.`;
    expect(proverb("nail", "shoe", "horse", "rider")).toEqual(expected);
  });

  it("proverb function does not hard code the rhyme dictionary", () => {
    const expected = `For want of a key the value was lost.\nAnd all for the want of a key.`;
    expect(proverb("key", "value")).toEqual(expected);
  });

  it("the whole proveb", () => {
    const expected = `For want of a nail the shoe was lost.\nFor want of a shoe the horse was lost.\nFor want of a horse the rider was lost.\nFor want of a rider the message was lost.\nFor want of a message the battle was lost.\nFor want of a battle the kingdom was lost.\nAnd all for the want of a nail.`;
    expect(
      proverb("nail", "shoe", "horse", "rider", "message", "battle", "kingdom")
    ).toEqual(expected);
  });

  it("proverb is the same each time", () => {
    expect(proverb("nail", "shoe")).toEqual(proverb("nail", "shoe"));
  });
});

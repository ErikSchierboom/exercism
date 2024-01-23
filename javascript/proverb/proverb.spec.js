import { proverb } from "./proverb";

describe("Proverb", () => {
  test("zero pieces", () => {
    const result = proverb();

    expect(result).toEqual("");
  });

  test("one piece", () => {
    const result = proverb("nail");

    expect(result).toEqual("And all for the want of a nail.");
  });

  test("two pieces", () => {
    const result = proverb("nail", "shoe");

    expect(result).toEqual(
      `For want of a nail the shoe was lost.
And all for the want of a nail.`
    );
  });

  test("three pieces", () => {
    const result = proverb("nail", "shoe", "horse");

    expect(result).toEqual(
      `For want of a nail the shoe was lost.
For want of a shoe the horse was lost.
And all for the want of a nail.`
    );
  });

  test("the whole proverb", () => {
    const result = proverb(
      "nail",
      "shoe",
      "horse",
      "rider",
      "message",
      "battle",
      "kingdom"
    );

    expect(result).toEqual(
      `For want of a nail the shoe was lost.
For want of a shoe the horse was lost.
For want of a horse the rider was lost.
For want of a rider the message was lost.
For want of a message the battle was lost.
For want of a battle the kingdom was lost.
And all for the want of a nail.`
    );
  });

  test("proverb is the same each time", () => {
    expect(proverb("nail", "shoe")).toEqual(proverb("nail", "shoe"));
  });

  test("four pieces modernized", () => {
    const result = proverb("pin", "gun", "soldier", "battle");

    expect(result).toEqual(
      `For want of a pin the gun was lost.
For want of a gun the soldier was lost.
For want of a soldier the battle was lost.
And all for the want of a pin.`
    );
  });

  test("the use of an optional qualifier in the final consequence", () => {
    const result = proverb(
      "nail",
      "shoe",
      "horse",
      "rider",
      "message",
      "battle",
      "kingdom",
      { qualifier: "horseshoe" }
    );

    expect(result).toEqual(
      `For want of a nail the shoe was lost.
For want of a shoe the horse was lost.
For want of a horse the rider was lost.
For want of a rider the message was lost.
For want of a message the battle was lost.
For want of a battle the kingdom was lost.
And all for the want of a horseshoe nail.`
    );
  });
});

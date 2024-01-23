import { hey } from "./bob";

describe("Bob", () => {
  it("stating something", () => {
    const result = hey("Tom-ay-to, tom-aaaah-to.");
    expect(result).toEqual("Whatever.");
  });

  it("shouting", () => {
    const result = hey("WATCH OUT!");
    expect(result).toEqual("Whoa, chill out!");
  });

  it("shouting gibberish", () => {
    const result = hey("FCECDFCAAB");
    expect(result).toEqual("Whoa, chill out!");
  });

  it("asking a question", () => {
    const result = hey("Does this cryogenic chamber make me look fat?");
    expect(result).toEqual("Sure.");
  });

  it("asking a numeric question", () => {
    const result = hey("You are, what, like 15?");
    expect(result).toEqual("Sure.");
  });

  it("asking gibberish", () => {
    const result = hey("fffbbcbeab?");
    expect(result).toEqual("Sure.");
  });

  it("talking forcefully", () => {
    const result = hey("Let's go make out behind the gym!");
    expect(result).toEqual("Whatever.");
  });

  it("using acronyms in regular speech", () => {
    const result = hey("It's OK if you don't want to go to the DMV.");
    expect(result).toEqual("Whatever.");
  });

  it("forceful question", () => {
    const result = hey("WHAT THE HELL WERE YOU THINKING?");
    expect(result).toEqual("Calm down, I know what I'm doing!");
  });

  it("shouting numbers", () => {
    const result = hey("1, 2, 3 GO!");
    expect(result).toEqual("Whoa, chill out!");
  });

  it("no letters", () => {
    const result = hey("1, 2, 3");
    expect(result).toEqual("Whatever.");
  });

  it("question with no letters", () => {
    const result = hey("4?");
    expect(result).toEqual("Sure.");
  });

  it("shouting with special characters", () => {
    const result = hey("ZOMG THE %^*@#$(*^ ZOMBIES ARE COMING!!11!!1!");
    expect(result).toEqual("Whoa, chill out!");
  });

  it("shouting with no exclamation mark", () => {
    const result = hey("I HATE THE DMV");
    expect(result).toEqual("Whoa, chill out!");
  });

  it("statement containing question mark", () => {
    const result = hey("Ending with ? means a question.");
    expect(result).toEqual("Whatever.");
  });

  it("prattling on", () => {
    const result = hey("Wait! Hang on.  Are you going to be OK?");
    expect(result).toEqual("Sure.");
  });

  it("silence", () => {
    const result = hey("");
    expect(result).toEqual("Fine. Be that way!");
  });

  it("prolonged silence", () => {
    const result = hey("   ");
    expect(result).toEqual("Fine. Be that way!");
  });

  it("alternate silence", () => {
    const result = hey("\t\t\t\t\t\t\t\t\t\t");
    expect(result).toEqual("Fine. Be that way!");
  });

  it("multiple line question", () => {
    const result = hey("\nDoes this cryogenic chamber make me look fat?\nNo.");
    expect(result).toEqual("Whatever.");
  });

  it("starting with whitespace", () => {
    const result = hey("         hmmmmmmm...");
    expect(result).toEqual("Whatever.");
  });

  it("ending with whitespace", () => {
    const result = hey("Okay if like my  spacebar  quite a bit?   ");
    expect(result).toEqual("Sure.");
  });

  it("other whitespace", () => {
    const result = hey("\n\r \t");
    expect(result).toEqual("Fine. Be that way!");
  });

  it("non-question ending with whitespace", () => {
    const result = hey("This is a statement ending with whitespace      ");
    expect(result).toEqual("Whatever.");
  });
});

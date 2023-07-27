open Jest;

describe("Hello World", () =>
  Expect.(
    test("says hello", () =>
      expect(HelloWorld.hello()) |> toBe("Hello, World!")
    )
  )
);

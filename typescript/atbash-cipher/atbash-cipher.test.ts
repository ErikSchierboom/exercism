import AtbashCipher from "./atbash-cipher";

describe("AtbashCipher", () => {
  let atbash: AtbashCipher;

  beforeAll(() => {
    atbash = new AtbashCipher();
  });

  describe("encoding", () => {
    it("encode yes", () => {
      const cipherText = atbash.encode("yes");
      expect(cipherText).toEqual("bvh");
    });

    it("encode no", () => {
      const cipherText = atbash.encode("no");
      expect(cipherText).toEqual("ml");
    });

    it("encode OMG", () => {
      const cipherText = atbash.encode("OMG");
      expect(cipherText).toEqual("lnt");
    });

    it("encode spaces", () => {
      const cipherText = atbash.encode("O M G");
      expect(cipherText).toEqual("lnt");
    });

    it("encode mindblowingly", () => {
      const cipherText = atbash.encode("mindblowingly");
      expect(cipherText).toEqual("nrmwy oldrm tob");
    });

    it("encode numbers", () => {
      const cipherText = atbash.encode("Testing,1 2 3, testing.");
      expect(cipherText).toEqual("gvhgr mt123 gvhgr mt");
    });

    it("encode deep thought", () => {
      const cipherText = atbash.encode("Truth is fiction.");
      expect(cipherText).toEqual("gifgs rhurx grlm");
    });

    it("encode all the letters", () => {
      const cipherText = atbash.encode("thequickbrownfoxjumpsoverthelazydog");
      expect(cipherText).toEqual("gsvjf rxpyi ldmul cqfnk hlevi gsvoz abwlt");
    });
  });

  describe("decode", () => {
    it("decode exercism", () => {
      const plainText = atbash.decode("vcvix rhn");
      expect(plainText).toEqual("exercism");
    });

    it("decode a sentence", () => {
      const cipherText = atbash.decode("zmlyh gzxov rhlug vmzhg vkkrm thglm v");
      expect(cipherText).toEqual("anobstacleisoftenasteppingstone");
    });

    it("decode numbers", () => {
      const plainText = atbash.decode("gvhgr mt123 gvhgr mt");
      expect(plainText).toEqual("testing123testing");
    });

    it("decode all the letters", () => {
      const cipherText = atbash.decode(
        "gsvjf rxpyi ldmul cqfnk hlevi gsvoz abwlt"
      );
      expect(cipherText).toEqual("thequickbrownfoxjumpsoverthelazydog");
    });
  });
});

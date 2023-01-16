require "spec"
require "../src/*"

describe "AtbashCipher" do
  it "encode yes" do
    AtbashCipher.encode("yes").should eq("bvh")
  end

  it "encode no" do
    AtbashCipher.encode("no").should eq("ml")
  end

  it "encode OMG" do
    AtbashCipher.encode("OMG").should eq("lnt")
  end

  it "encode spaces" do
    AtbashCipher.encode("O M G").should eq("lnt")
  end

  it "encode mindblowingly" do
    AtbashCipher.encode("mindblowingly").should eq("nrmwy oldrm tob")
  end

  it "encode numbers" do
    AtbashCipher.encode("Testing,1 2 3, testing.").should eq("gvhgr mt123 gvhgr mt")
  end

  it "encode deep thought" do
    AtbashCipher.encode("Truth is fiction.").should eq("gifgs rhurx grlm")
  end

  it "encode all the letters" do
    AtbashCipher.encode("The quick brown fox jumps over the lazy dog.").should eq("gsvjf rxpyi ldmul cqfnk hlevi gsvoz abwlt")
  end

  it "decode exercism" do
    AtbashCipher.decode("vcvix rhn").should eq("exercism")
  end

  it "decode a sentence" do
    AtbashCipher.decode("zmlyh gzxov rhlug vmzhg vkkrm thglm v").should eq("anobstacleisoftenasteppingstone")
  end

  it "decode numbers" do
    AtbashCipher.decode("gvhgr mt123 gvhgr mt").should eq("testing123testing")
  end

  it "decode all the letters" do
    AtbashCipher.decode("gsvjf rxpyi ldmul cqfnk hlevi gsvoz abwlt").should eq("thequickbrownfoxjumpsoverthelazydog")
  end

  it "decode with too many spaces" do
    AtbashCipher.decode("vc vix    r hn").should eq("exercism")
  end

  it "decode with no spaces" do
    AtbashCipher.decode("zmlyhgzxovrhlugvmzhgvkkrmthglmv").should eq("anobstacleisoftenasteppingstone")
  end
end

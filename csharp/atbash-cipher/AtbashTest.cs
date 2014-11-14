using NUnit.Framework;

namespace Exercism
{
    [TestFixture]
    public class AtbashTest
    {
        // change Ignore to false to run test case or just remove 'Ignore = true'
        [TestCase("no", Result = "ml")]
        [TestCase("yes", Result = "bvh")]
        [TestCase("OMG", Result = "lnt")]
        [TestCase("mindblowingly", Result = "nrmwy oldrm tob")]
        [TestCase("Testing, 1 2 3, testing.", Result = "gvhgr mt123 gvhgr mt")]
        [TestCase("Truth is fiction.", Result = "gifgs rhurx grlm")]
        [TestCase("The quick brown fox jumps over the lazy dog.", Result = "gsvjf rxpyi ldmul cqfnk hlevi gsvoz abwlt")]
        public string Encodes_words_using_atbash_cipher(string words)
        {
            return Atbash.Encode(words);
        }
    }
}
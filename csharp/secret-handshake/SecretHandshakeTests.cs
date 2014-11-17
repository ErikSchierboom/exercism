using NUnit.Framework;

namespace Exercism
{
    [TestFixture]
    public class SecretHandshakeTests
    {
        [Test]
        public void Test_1_handshake_to_wink()
        {
            var handshake = new SecretHandshake(1);
            Assert.That(handshake.Commands(), Is.EqualTo(new string[] { "wink" }));
        }

        [Test]
        public void Test_10_handshake_to_double_blink()
        {
            var handshake = new SecretHandshake(2);
            Assert.That(handshake.Commands(), Is.EqualTo(new string[] { "double blink" }));
        }

        [Test]
        public void Test_100_handshake_to_close_your_eyes()
        {
            var handshake = new SecretHandshake(4);
            Assert.That(handshake.Commands(), Is.EqualTo(new string[] { "close your eyes" }));
        }

        [Test]
        public void Test_1000_handshake_to_close_your_eyes()
        {
            var handshake = new SecretHandshake(8);
            Assert.That(handshake.Commands(), Is.EqualTo(new string[] { "jump" }));
        }

        [Test]
        public void Test_handshake_11_to_wink_and_double_blink()
        {
            var handshake = new SecretHandshake(3);
            Assert.That(handshake.Commands(), Is.EqualTo(new string[] { "wink", "double blink" }));
        }

        [Test]
        public void Test_handshake_10011_to_double_blink_and_wink()
        {
            var handshake = new SecretHandshake(19);
            Assert.That(handshake.Commands(), Is.EqualTo(new string[] { "double blink", "wink" }));
        }

        [Test]
        public void Test_handshake_11111_to_all_commands_reversed()
        {
            var handshake = new SecretHandshake(31);
            Assert.That(handshake.Commands(), Is.EqualTo(new string[] { "jump", "close your eyes", "double blink", "wink" }));
        }
    }
}
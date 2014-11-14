using NUnit.Framework;

namespace Exercism
{
    [TestFixture]
    public class RobotNameTest
    {
        private Robot robot;

        [SetUp]
        public void Setup()
        {
            this.robot = new Robot();
        }

        [Test]
        public void Robot_has_a_name()
        {
            StringAssert.IsMatch(@"[A-Z]{2}\d{3}", this.robot.Name);
        }

        [Test]
        public void Name_is_the_same_each_time()
        {
            Assert.That(this.robot.Name, Is.EqualTo(this.robot.Name));
        }

        [Test]
        public void Different_robots_have_different_names()
        {
            var robot2 = new Robot();
            Assert.That(this.robot.Name, Is.Not.EqualTo(robot2.Name));
        }

        [Test]
        public void Can_reset_the_name()
        {
            var originalName = this.robot.Name;
            this.robot.Reset();
            Assert.That(this.robot.Name, Is.Not.EqualTo(originalName));
        }
    }
}
using NUnit.Framework;

namespace Exercism
{
    [TestFixture]
    public class DequeTest
    {
        private Deque<int> deque;

        [SetUp]
        public void Setup()
        {
            this.deque = new Deque<int>();
        }

        [Test]
        public void Push_and_pop_are_first_in_last_out_order()
        {
            this.deque.Push(10);
            this.deque.Push(20);
            Assert.That(this.deque.Pop(), Is.EqualTo(20));
            Assert.That(this.deque.Pop(), Is.EqualTo(10));
        }

        [Test]
        public void Push_and_shift_are_first_in_first_out_order()
        {
            this.deque.Push(10);
            this.deque.Push(20);
            Assert.That(this.deque.Shift(), Is.EqualTo(10));
            Assert.That(this.deque.Shift(), Is.EqualTo(20));
        }

        [Test]
        public void Unshift_and_shift_are_last_in_first_out_order()
        {
            this.deque.Unshift(10);
            this.deque.Unshift(20);
            Assert.That(this.deque.Shift(), Is.EqualTo(20));
            Assert.That(this.deque.Shift(), Is.EqualTo(10));
        }

        [Test]
        public void Unshift_and_pop_are_last_in_last_out_order()
        {
            this.deque.Unshift(10);
            this.deque.Unshift(20);
            Assert.That(this.deque.Pop(), Is.EqualTo(10));
            Assert.That(this.deque.Pop(), Is.EqualTo(20));
        }

        [Test]
        public void Push_and_pop_can_handle_multiple_values()
        {
            this.deque.Push(10);
            this.deque.Push(20);
            this.deque.Push(30);
            Assert.That(this.deque.Pop(), Is.EqualTo(30));
            Assert.That(this.deque.Pop(), Is.EqualTo(20));
            Assert.That(this.deque.Pop(), Is.EqualTo(10));
        }

        [Test]
        public void Unshift_and_shift_can_handle_multiple_values()
        {
            this.deque.Unshift(10);
            this.deque.Unshift(20);
            this.deque.Unshift(30);
            Assert.That(this.deque.Shift(), Is.EqualTo(30));
            Assert.That(this.deque.Shift(), Is.EqualTo(20));
            Assert.That(this.deque.Shift(), Is.EqualTo(10));
        }

        [Test]
        public void All_methods_of_manipulating_the_deque_can_be_used_together()
        {
            this.deque.Push(10);
            this.deque.Push(20);
            Assert.That(this.deque.Pop(), Is.EqualTo(20));

            this.deque.Push(30);
            Assert.That(this.deque.Shift(), Is.EqualTo(10));

            this.deque.Unshift(40);
            this.deque.Push(50);
            Assert.That(this.deque.Shift(), Is.EqualTo(40));
            Assert.That(this.deque.Pop(), Is.EqualTo(50));
            Assert.That(this.deque.Shift(), Is.EqualTo(30));
        }
    }
}
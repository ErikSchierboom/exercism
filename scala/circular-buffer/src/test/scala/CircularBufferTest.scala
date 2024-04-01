import org.scalatest.funsuite.AnyFunSuite
import org.scalatest.matchers.should.Matchers


class CircularBufferTest extends AnyFunSuite with Matchers {

  test("Reading empty buffer should fail") {
    val buff = new CircularBuffer(1)
    assertThrows[EmptyBufferException](buff.read())
  }

  test("Can read an item just written") {    val buff = new CircularBuffer(1)
    buff.write(1)
    buff.read() should be (1)
  }

  test("Each item may only be read once") {    val buff = new CircularBuffer(1)
    buff.write(1)
    buff.read() should be (1)
    assertThrows[EmptyBufferException](buff.read())
  }

  test("Items are read in the order they are written") {    val buff = new CircularBuffer(2)
    buff.write(1)
    buff.write(2)
    buff.read() should be (1)
    buff.read() should be (2)
  }

  test("Full buffer can't be written to") {    val buff = new CircularBuffer(1)
    buff.write(1)
    assertThrows[FullBufferException](buff.write(2))
  }

  test("A read frees up capacity for another write") {    val buff = new CircularBuffer(1)
    buff.write(1)
    buff.read() should be (1)
    buff.write(2)
    buff.read() should be (2)
  }

  test("Read position is maintained even across multiple writes") {    val buff = new CircularBuffer(3)
    buff.write(1)
    buff.write(2)
    buff.read() should be (1)
    buff.write(3)
    buff.read() should be (2)
    buff.read() should be (3)
  }

  test("Items cleared out of buffer can't be read") {    val buff = new CircularBuffer(1)
    buff.write(1)
    buff.clear()
    assertThrows[EmptyBufferException](buff.read())
  }

  test("Clear frees up capacity for another write") {    val buff = new CircularBuffer(1)
    buff.write(1)
    buff.clear()
    buff.write(2)
    buff.read() should be (2)
  }

  test("Clear does nothing on empty buffer") {    val buff = new CircularBuffer(1)
    buff.clear()
    buff.write(1)
    buff.read() should be (1)
  }

  test("Overwrite acts like write on non-full buffer") {    val buff = new CircularBuffer(2)
    buff.write(1)
    buff.overwrite(2)
    buff.read() should be (1)
    buff.read() should be (2)
  }

  test("Overwrite replaces the oldest item on full buffer") {    val buff = new CircularBuffer(2)
    buff.write(1)
    buff.write(2)
    buff.overwrite(3)
    buff.read() should be (2)
    buff.read() should be (3)
  }

  test("Overwrite replaces the oldest item remaining in buffer following a read") {    val buff = new CircularBuffer(3)
    buff.write(1)
    buff.write(2)
    buff.write(3)
    buff.read() should be (1)
    buff.write(4)
    buff.overwrite(5)
    buff.read() should be (3)
    buff.read() should be (4)
    buff.read() should be (5)
  }

  test("Initial clear does not affect wrapping around") {    val buff = new CircularBuffer(2)
    buff.clear()
    buff.write(1)
    buff.write(2)
    buff.overwrite(3)
    buff.overwrite(4)
    buff.read() should be (3)
    buff.read() should be (4)
    assertThrows[EmptyBufferException](buff.read())
  }
}
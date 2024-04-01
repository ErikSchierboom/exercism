import spock.lang.*

class CircularBufferSpec extends Specification {

    def "Reading empty buffer should fail"() {
        setup:
        CircularBuffer buff = new CircularBuffer(1)

        when:
        buff.read()

        then:
        thrown(EmptyBufferException)
    }

     def "Can read an item just written"() {
        setup:
        CircularBuffer buff = new CircularBuffer(1)

        when:
        buff.write(1)

        then:
        buff.read() == 1
    }

     def "Each item may only be read once"() {
        setup:
        CircularBuffer buff = new CircularBuffer(1)

        when:
        buff.write(1)

        then:
        buff.read() == 1

        when:
        buff.read()

        then:
        thrown(EmptyBufferException)
    }

     def "Items are read in the order they are written"() {
        setup:
        CircularBuffer buff = new CircularBuffer(2)

        when:
        buff.write(1)
        buff.write(2)

        then:
        buff.read() == 1
        buff.read() == 2
    }

     def "Full buffer can't be written to"() {
        setup:
        CircularBuffer buff = new CircularBuffer(1)

        when:
        buff.write(1)
        buff.write(2)

        then:
        thrown(FullBufferException)
    }

     def "A read frees up capacity for another write"() {
        setup:
        CircularBuffer buff = new CircularBuffer(1)

        when:
        buff.write(1)

        then:
        buff.read() == 1

        when:
        buff.write(2)

        then:
        buff.read() == 2
    }

     def "Read position is maintained even across multiple writes"() {
        setup:
        CircularBuffer buff = new CircularBuffer(3)

        when:
        buff.write(1)
        buff.write(2)

        then:
        buff.read() == 1

        when:
        buff.write(3)

        then:
        buff.read() == 2
        buff.read() == 3
    }

     def "Items cleared out of buffer can't be read"() {
        setup:
        CircularBuffer buff = new CircularBuffer(1)

        when:
        buff.write(1)
        buff.clear()
        buff.read()

        then:
        thrown(EmptyBufferException)
    }

     def "Clear frees up capacity for another write"() {
        setup:
        CircularBuffer buff = new CircularBuffer(1)

        when:
        buff.write(1)
        buff.clear()
        buff.write(2)

        then:
        buff.read() == 2
    }

     def "Clear does nothing on empty buffer"() {
        setup:
        CircularBuffer buff = new CircularBuffer(1)

        when:
        buff.clear()
        buff.write(1)

        then:
        buff.read() == 1
    }

     def "Overwrite acts like write on non-full buffer"() {
        setup:
        CircularBuffer buff = new CircularBuffer(2)

        when:
        buff.write(1)
        buff.overwrite(2)

        then:
        buff.read() == 1
        buff.read() == 2
    }

     def "Overwrite replaces the oldest item on full buffer"() {
        setup:
        CircularBuffer buff = new CircularBuffer(2)

        when:
        buff.write(1)
        buff.write(2)
        buff.overwrite(3)

        then:
        buff.read() == 2
        buff.read() == 3
    }

     def "Overwrite replaces the oldest item remaining in buffer following a read"() {
        setup:
        CircularBuffer buff = new CircularBuffer(3)

        when:
        buff.write(1)
        buff.write(2)
        buff.write(3)

        then:
        buff.read() == 1

        when:
        buff.write(4)
        buff.overwrite(5)

        then:
        buff.read() == 3
        buff.read() == 4
        buff.read() == 5
    }

     def "Initial clear does not affect wrapping around"() {
        setup:
        CircularBuffer buff = new CircularBuffer(2)

        when:
        buff.clear()
        buff.write(1)
        buff.write(2)
        buff.overwrite(3)
        buff.overwrite(4)

        then:
        buff.read() == 3
        buff.read() == 4

        when:
        buff.read()

        then:
        thrown(EmptyBufferException)
    }
}

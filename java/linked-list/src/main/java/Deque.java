public class Deque<T> {

    private class Node {
        private T value;
        private Node next;
        private Node prev;

        Node(T value, Node next, Node prev) {
            this.value = value;
            this.next = next;
            this.prev = prev;
        }
    }

    private Node first;
    private Node last;

    public void push(T value) {
        Node newLast = new Node(value, null, this.last);

        if (this.last != null) {
            this.last.next = newLast;
        }

        this.last = newLast;

        if (this.first == null) {
            this.first = this.last;
        }
    }

    public T pop() {
        T value = this.last.value;
        this.last = this.last.prev;

        if (this.last != null) {
            this.last.next = null;
        }

        return value;
    }

    public void unshift(T value) {
        Node newFirst = new Node(value, this.first, null);

        if (this.first != null) {
            this.first.prev = newFirst;
        }

        this.first = newFirst;

        if (this.last == null) {
            this.last = this.first;
        }
    }

    public T shift() {
        T value = this.first.value;
        this.first.prev = null;
        this.first = this.first.next;

        return value;
    }
}
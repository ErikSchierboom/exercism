import java.lang.reflect.Array;
import java.util.NoSuchElementException;

public class SimpleLinkedList<T> {

    private class SimpleLinkedListElement {

        private T value;
        private SimpleLinkedListElement next;

        SimpleLinkedListElement(T value, SimpleLinkedListElement next) {

            this.value = value;
            this.next = next;
        }
    }

    private int size = 0;
    private SimpleLinkedListElement head = null;

    public SimpleLinkedList() {
    }

    public SimpleLinkedList(T[] values) {
        for (int i = 0; i < values.length; i++) {
            this.push(values[i]);
        }
    }

    public int size() {
        return this.size;
    }

    public void push(T value) {
        this.head = new SimpleLinkedListElement(value, this.head);
        this.size++;
    }

    public T pop() {
        if (this.head == null) {
            throw new NoSuchElementException();
        }

        T value = this.head.value;
        this.head = this.head.next;
        this.size--;

        return value;
    }

    public void reverse() {
        if (this.size == 0) {
            return;
        }

        SimpleLinkedListElement previous = null;
        SimpleLinkedListElement next = null;
        SimpleLinkedListElement current = this.head;

        while (current != null) {
            next = current.next;
            current.next = previous;
            previous = current;
            current = next;
        }

        this.head = previous;
    }

    public T[] asArray(Class<T> targetClass) {

        T[] target = (T[]) Array.newInstance(targetClass, this.size);
        SimpleLinkedListElement current = this.head;

        for (int i = 0; i < size; i++) {
            target[i] = current.value;
            current = current.next;
        }

        return target;
    }
}
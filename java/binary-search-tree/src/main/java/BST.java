import java.util.LinkedList;
import java.util.List;

public class BST<T extends Comparable<T>> {
    private Node<T> root = null;

    public void insert(T value) {
        if (root == null)
            root = new Node<>(value);
        else
            this.insertToNode(root, value);
    }

    public Node<T> insertToNode(Node<T> node, T value) {
        if (node == null)
            return new Node<T>(value);

        if (value.compareTo(node.data) <= 0)
            node.setLeft(insertToNode(node.getLeft(), value));
        else
            node.setRight(insertToNode(node.getRight(), value));

        return node;
    }

    public Node<T> getRoot() {
        return root;
    }

    public List<T> getAsLevelOrderList() {
        List<Node<T>> nodes = new LinkedList<Node<T>>();
        nodes.add(root);

        return getLevelNodeValues(nodes);
    }

    public List<T> getAsSortedList() {
        return getSortedNodeValues(root);
    }

    public List<T> getSortedNodeValues(Node<T> node) {
        List<T> values = new LinkedList<>();

        if (node == null)
            return values;

        values.addAll(getSortedNodeValues(node.getLeft()));
        values.add(node.data);
        values.addAll(getSortedNodeValues(node.getRight()));

        return values;
    }

    public List<T> getLevelNodeValues(List<Node<T>> nodes) {
        List<T> values = new LinkedList<>();
        List<Node<T>> childNodes = new LinkedList<>();

        for (Node<T> node : nodes) {
            if (node == null)
                continue;

            values.add(node.data);
            childNodes.add(node.getLeft());
            childNodes.add(node.getRight());
        }

        if (!childNodes.isEmpty())
            values.addAll(getLevelNodeValues(childNodes));

        return values;
    }

    public static class Node<T> {
        private final T data;
        private Node<T> left;
        private Node<T> right;

        public Node(T data) {
            this.data = data;
        }

        public T getData() {
            return data;
        }

        public Node getLeft() {
            return left;
        }

        public void setLeft(Node<T> left) {
            this.left = left;
        }

        public Node getRight() {
            return right;
        }

        public void setRight(Node<T> right) {
            this.right = right;
        }
    }
}



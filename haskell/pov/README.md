# Pov

Reparent a graph on a selected node

# Tree Reparenting

This exercise is all about re-orientating a graph to see things from a different
point of view. For example family trees are usually presented from the
ancestor's perspective:

```
          O
          |
    1-----2-----3
    |     |     |
  4-+-5 6-+-7 8-+-9
```

But the same information can be presented from the perspective of any other node
in the graph, by pulling it up to the root and dragging its relationships along
with it. So the same graph from 6's perspective would look like:

```
          6
          |
    7-----+-----2
                |
                0
          1-----+-----3
          |           |
        4-+-5       8-+-9
```

This lets us more simply describe the paths between two nodes. So for example
the path from 6-9 (which in the first graph goes up to the root and then down to
a different leaf node) can be seen to follow the path 6-2-0-3-9

This exercise involves taking an input graph and re-orientating it one one of
the nodes. 

Check out [Exercism
Help](http://help.exercism.io/getting-started-with-haskell.html) for
instructions to get started writing Haskell.

## Running Tests

Use `runhaskell` (included in the Haskell Platform) to compile and run your
Haskell code.

    $ runhaskell -Wall bob_test.hs

## Source

Adaptation of exercise from 4clojure [view source](https://www.4clojure.com/)

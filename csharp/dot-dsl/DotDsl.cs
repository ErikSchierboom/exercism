using System;
using System.Collections;
using System.Collections.Generic;

public record Attr(string Key, string Value);

public class Node : Element
{
    public Node(string name) => Name = name;

    public string Name { get; }

    public override bool Equals(object obj) => obj is Node node && node.Name == Name;

    public override int GetHashCode() => HashCode.Combine(Name);
}

public class Edge : Element
{
    public Edge(string node1, string node2) => (Node1, Node2) = (node1, node2);

    public string Node1 { get; }
    public string Node2 { get; }

    public override bool Equals(object obj) => obj is Edge edge && edge.Node1 == Node1 && edge.Node2 == Node2;

    public override int GetHashCode() => HashCode.Combine(Node1, Node2);
}

public class Graph : Element
{
    private readonly List<Node> nodes = new();
    private readonly List<Edge> edges = new();

    public IEnumerable<Node> Nodes => nodes;
    public IEnumerable<Edge> Edges => edges;
    public IEnumerable<Attr> Attrs => attrs;

    public void Add(Node node) => nodes.Add(node);
    public void Add(Edge edge) => edges.Add(edge);
}

public abstract class Element : IEnumerable<Attr>
{
    protected readonly List<Attr> attrs = new();

    public void Add(string key, string value) => attrs.Add(new Attr(key, value));

    public IEnumerator<Attr> GetEnumerator() => attrs.GetEnumerator();
    IEnumerator IEnumerable.GetEnumerator() => GetEnumerator();
}
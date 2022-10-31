using System;
using System.Collections.Generic;
using System.Linq;

public class Tree : IEquatable<Tree>
{
    public Tree(string value, params Tree[] children)
    {
        Value = value;
        Children = children;
    }

    public string Value { get; }
    public IEnumerable<Tree> Children { get; }

    public bool Equals(Tree other) => Value.Equals(other.Value) && Children.SequenceEqual(other.Children);
}

public class GraphCrumb
{
    public GraphCrumb(string value, IEnumerable<Tree> left, IEnumerable<Tree> right)
    {
        Value = value;
        Left = left;
        Right = right;
    }

    public string Value { get; }
    public IEnumerable<Tree> Left { get; }
    public IEnumerable<Tree> Right { get; }
}

public class GraphZipper
{
    public GraphZipper(Tree focus, IEnumerable<GraphCrumb> crumbs)
    {
        Focus = focus;
        Crumbs = crumbs;
    }

    public Tree Focus { get; }
    public IEnumerable<GraphCrumb> Crumbs { get; }
}

public static class Pov
{
    public static Tree CreateGraph(string value, IEnumerable<Tree> children) 
        => new Tree(value, children.ToArray());

    public static Tree FromPov(Tree tree, string value) 
        => ChangeParent(FindNode(value, GraphToZipper(tree)));

    public static IEnumerable<string> PathTo(string value1, string value2, Tree tree)
        => ZipperToPath(FindNode(value2, GraphToZipper(FromPov(tree, value1))));

    private static GraphZipper GraphToZipper(Tree tree)
    {
        if (tree == null)
            return null;

        return new GraphZipper(tree, Enumerable.Empty<GraphCrumb>());
    }

    private static IEnumerable<string> ZipperToPath(GraphZipper zipper)
    {
        if (zipper == null)
            return null;

        return zipper.Crumbs.Select(c => c.Value).Reverse().Concat(new[] { zipper.Focus.Value });
    }

    private static GraphZipper GoDown(GraphZipper zipper)
    {        
        if (zipper == null || !zipper.Focus.Children.Any())
            return null;

        var focus = zipper.Focus;
        var children = focus.Children;

        var newCrumb = new GraphCrumb(focus.Value, Enumerable.Empty<Tree>(), children.Skip(1));

        return new GraphZipper(children.First(), new[] { newCrumb }.Concat(zipper.Crumbs));
    }

    private static GraphZipper GoRight(GraphZipper zipper)
    {        
        if (zipper == null || !zipper.Crumbs.Any() || !zipper.Crumbs.First().Right.Any())
            return null;

        var crumbs = zipper.Crumbs;
        var firstCrumb = crumbs.First();

        var newCrumb = new GraphCrumb(firstCrumb.Value, firstCrumb.Left.Concat(new[] { zipper.Focus }), firstCrumb.Right.Skip(1));

        return new GraphZipper(firstCrumb.Right.First(), new[] { newCrumb }.Concat(crumbs.Skip(1)));
    }

    private static GraphZipper FindNode(string value, GraphZipper zipper)
    {
        if (zipper == null || zipper.Focus.Value.CompareTo(value) == 0)
            return zipper;

        return FindNode(value, GoDown(zipper)) ?? FindNode(value, GoRight(zipper));
    }

    private static Tree ChangeParent(GraphZipper zipper)
    {
        if (zipper == null)
            return null;

        if (!zipper.Crumbs.Any())
            return zipper.Focus;

        var firstCrumb = zipper.Crumbs.First();
        var focus = zipper.Focus;

        var newZipper = new GraphZipper(CreateGraph(firstCrumb.Value, firstCrumb.Left.Concat(firstCrumb.Right)), zipper.Crumbs.Skip(1));
        var parentGraph = ChangeParent(newZipper);

        var ys = focus.Children.Concat(new[] { parentGraph });
        return CreateGraph(focus.Value, ys);
    }
}
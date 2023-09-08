using System;
using System.Collections.Generic;
using System.Linq;

public record BinTree(int Value, BinTree Left, BinTree Right);
public abstract record BinTreeCrumb(int Value, BinTree Tree);
public record BinTreeLeftCrumb(int Value, BinTree Tree) : BinTreeCrumb(Value, Tree);
public record BinTreeRightCrumb(int Value, BinTree Tree) : BinTreeCrumb(Value, Tree);

public class Zipper : IEquatable<Zipper>
{
    private readonly int value;
    private readonly BinTree left;
    private readonly BinTree right;
    private readonly List<BinTreeCrumb> crumbs;

    private Zipper(int value, BinTree left, BinTree right, List<BinTreeCrumb> crumbs) =>
        (this.value, this.left, this.right, this.crumbs) = (value, left, right, crumbs);
    
    public int Value() => value;

    public Zipper SetValue(int newValue) => new(newValue, left, right, crumbs);

    public Zipper SetLeft(BinTree binTree) => new(value, binTree, right, crumbs);

    public Zipper SetRight(BinTree binTree) => new(value, left, binTree, crumbs);

    public Zipper Left()
    {
        if (left == null)
            return null;
        
        var newCrumbs = new[] { new BinTreeLeftCrumb(value, right) }.Concat(crumbs).ToList();
        return new Zipper(left.Value, left.Left, left.Right, newCrumbs);
    }

    public Zipper Right()
    {
        if (right == null)
            return null;

        var newCrumbs = new[] { new BinTreeRightCrumb(value, left) }.Concat(crumbs).ToList();
        return new Zipper(right.Value, right.Left, right.Right, newCrumbs);
    }

    public Zipper Up()
    {
        if (crumbs.Count == 0)
            return null;

        var firstCrumb = crumbs[0];
        var remainingCrumbs = crumbs.Skip(1).ToList();

        return firstCrumb switch
        {
            BinTreeLeftCrumb => new Zipper(firstCrumb.Value, new BinTree(value, left, right), firstCrumb.Tree,
                remainingCrumbs),
            BinTreeRightCrumb => new Zipper(firstCrumb.Value, firstCrumb.Tree, new BinTree(value, left, right),
                remainingCrumbs),
            _ => null
        };
    }

    public BinTree ToTree() =>
        crumbs.Aggregate(new BinTree(value, left, right), (current, crumb) => crumb switch
        {
            BinTreeLeftCrumb => new BinTree(crumb.Value, current, crumb.Tree),
            BinTreeRightCrumb => new BinTree(crumb.Value, crumb.Tree, current),
            _ => current
        });

    public bool Equals(Zipper other) => other != null && ToTree().Equals(other.ToTree());

    public static Zipper FromTree(BinTree tree) => new(tree.Value, tree.Left, tree.Right, new List<BinTreeCrumb>());
}
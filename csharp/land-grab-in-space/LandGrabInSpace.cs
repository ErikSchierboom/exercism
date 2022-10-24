using System;
using System.Collections.Generic;
using System.Linq;

public struct Coord
{
    public Coord(ushort x, ushort y) => (X, Y) = (x, y);

    public ushort X { get; }
    public ushort Y { get; }
}

public struct Plot
{
    public Plot(Coord topLeft, Coord topRight, Coord bottomRight, Coord bottomLeft) =>
        (TopLeft, TopRight, BottomRight, BottomLeft) = (topLeft, topRight, bottomRight, bottomLeft);

    public Coord TopLeft { get; }
    public Coord TopRight { get; }
    public Coord BottomRight { get; }
    public Coord BottomLeft { get; }

    public int LongestSide => 
        new[] { TopLeft.X - TopRight.X, TopRight.Y - BottomRight.Y, BottomLeft.Y - BottomRight.Y, TopLeft.X - BottomLeft.X }.Max();
}

public class ClaimsHandler
{
    private readonly HashSet<Plot> _plots = new();

    public void StakeClaim(Plot plot) => _plots.Add(plot);

    public bool IsClaimStaked(Plot plot) => _plots.Contains(plot);

    public bool IsLastClaim(Plot plot) => _plots.Last().Equals(plot);

    public Plot GetClaimWithLongestSide() => _plots.MaxBy(plot => plot.LongestSide);
}

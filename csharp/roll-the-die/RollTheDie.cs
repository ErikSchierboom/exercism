using System;

public class Player
{    
    public int RollDie() =>
        Random.Shared.Next(1, 19);

    public double GenerateSpellStrength() =>
        Random.Shared.NextDouble() * 100;
}

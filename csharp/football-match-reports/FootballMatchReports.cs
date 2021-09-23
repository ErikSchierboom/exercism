using System;

public static class PlayAnalyzer
{
    public static string AnalyzeOnField(int shirtNum) =>
        shirtNum switch
        {
            1 => "goalie",
            2 => "left back",
            3 or 4 => "center back",
            5 => "right back",
            6 or 7 or 8 => "midfielder",
            9 => "left wing",
            10 => "striker",
            11 => "right wing",
            _ => throw new ArgumentException("Invalid shirt number", nameof(shirtNum))
        };

    public static string AnalyzeOffField(object report) =>
        report switch
        {
            int shirtNum => AnalyzeOnField(shirtNum),
            string text => text,
            Injury injury => $"{injury.GetDescription()} Medics are on the field.",
            Incident incident => incident.GetDescription(),
            Manager manager when manager.Name.Length == 0 => "the manager",
            Manager manager => manager.Name,
            _ => throw new ArgumentException("Invalid report", nameof(report))
        };
}

// **** please do not modify the Manager class ****
public class Manager
{
    public string Name { get; }

    public Manager(string name)
    {
        this.Name = name;
    }
}

// **** please do not modify the Incident class or any subclasses ****
public class Incident
{
    public virtual string GetDescription() => "An incident happened.";
}

// **** please do not modify the Foul class ****
public class Foul : Incident
{
    public override string GetDescription() => "The referee deemed a foul.";
}

// **** please do not modify the Injury class ****
public class Injury : Incident
{
    public override string GetDescription() => "A player is injured.";
}

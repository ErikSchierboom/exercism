using System.Collections.Generic;

public record FacialFeatures(string EyeColor, decimal PhiltrumWidth);

public record Identity(string Email, FacialFeatures FacialFeatures);

public class Authenticator
{
    private readonly Identity _admin = new("admin@exerc.ism", new FacialFeatures("green", 0.9m));
    private readonly HashSet<Identity> _registeredIdentities = new();
    
    public static bool AreSameFace(FacialFeatures faceA, FacialFeatures faceB) => faceA.Equals(faceB);

    public bool IsAdmin(Identity identity) => identity.Equals(_admin);

    public bool Register(Identity identity) => _registeredIdentities.Add(identity);

    public bool IsRegistered(Identity identity) => _registeredIdentities.Contains(identity);

    public static bool AreSameObject(Identity identityA, Identity identityB) => ReferenceEquals(identityA, identityB);
}

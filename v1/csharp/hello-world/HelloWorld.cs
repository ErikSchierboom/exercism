public static class HelloWorld
{
    public static string Hello(string name) => $"Hello, {name ?? "World"}!";
}
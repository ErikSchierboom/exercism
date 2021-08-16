using System;

public static class ErrorHandling
{
    public static void HandleErrorByThrowingException() => throw new Exception();

    public static int? HandleErrorByReturningNullableType(string input) =>
        int.TryParse(input, out var number) ? number : null;

    public static bool HandleErrorWithOutParam(string input, out int result) =>
        int.TryParse(input, out result);

    public static void DisposableResourcesAreDisposedWhenExceptionIsThrown(IDisposable disposableResource)
    {
        using (disposableResource)
            throw new Exception();
    }
}
using System;

public static class SimpleCalculator
{
    public static string Calculate(int operand1, int operand2, string operation)
    {
        try
        {
            return operation switch
            {
                "+" => $"{operand1} + {operand2} = {operand1 + operand2}",
                "*" => $"{operand1} * {operand2} = {operand1 * operand2}",
                "/" => $"{operand1} / {operand2} = {operand1 / operand2}",
                null => throw new ArgumentNullException(nameof(operation)),
                "" => throw new ArgumentException("Invalid operation", nameof(operation)),
                _ => throw new ArgumentOutOfRangeException(nameof(operation))
            };
        }
        catch (DivideByZeroException)
        {
            return "Division by zero is not allowed.";
        }
    }
}

/**** Please do not modify the code below ****/
public static class SimpleOperation
{
    public static int Division(int operand1, int operand2)
    {
        return operand1 / operand2;
    }

    public static int Multiplication(int operand1, int operand2)
    {
        return operand1 * operand2;
    }
    public static int Addition(int operand1, int operand2)
    {
        return operand1 + operand2;
    }
}

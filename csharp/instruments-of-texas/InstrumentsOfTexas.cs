using System;

public class CalculationException : Exception
{
    public CalculationException(int operand1, int operand2, string message, Exception inner) : base(message, inner) =>
        (Operand1, Operand2) = (operand1, operand2);

    public int Operand1 { get; }
    public int Operand2 { get; }
}

public class CalculatorTestHarness
{
    private Calculator calculator;

    public CalculatorTestHarness(Calculator calculator) => this.calculator = calculator;

    public string TestMultiplication(int x, int y)
    {
        try
        {
            Multiply(x, y);
            return "Multiply succeeded";
        }
        catch (CalculationException e) when (e.Operand1 < 0 && e.Operand2 < 0)
        {
            return "Multiply failed for negative operands. Arithmetic operation resulted in an overflow.";
        }
        catch (CalculationException)
        {
            return "Multiply failed for mixed or positive operands. Arithmetic operation resulted in an overflow.";
        }
    }

    public void Multiply(int x, int y)
    {
        try
        {
            calculator.Multiply(x, y);
        }
        catch (OverflowException e)
        {
            throw new CalculationException(x, y, "", e);
        }
    }
}


// Please do not modify the code below.
// If there is an overflow in the multiplication operation
// then a System.OverflowException is thrown.
public class Calculator
{
    public int Multiply(int x, int y)
    {
        checked
        {
            return x * y;
        }
    }
}

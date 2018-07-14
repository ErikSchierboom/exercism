using System;

public class BankAccount
{
    private object _lock = new object();
    private bool closed = true;
    private decimal balance = 0;

    public void Open()
    {
        lock (_lock)
        {
            closed = false;
        }
    }

    public decimal GetBalance()
    {
        lock (_lock)
        {
            if (closed)
            {
                throw new InvalidOperationException();
            }

            return balance;
        }
    }

    public void UpdateBalance(decimal amount)
    {
        lock (_lock)
        {
            balance += amount;
        }
    }

    public void Close()
    {
        lock (_lock)
        {
            closed = true;
        }
    }
}
using System;

public class BankAccount
{
    private readonly object _lock = new object();

    private float _balance;
    private bool _isOpen;

    public void Open() => _isOpen = true;

    public void Close() => _isOpen = false;

    public float Balance => _isOpen ? _balance : throw new InvalidOperationException();

    public void UpdateBalance(float change)
    {
        if (!_isOpen)
            throw new InvalidOperationException("Cannot update balance on an account that isn't open");

        lock (_lock)
            _balance += change;
    }
}

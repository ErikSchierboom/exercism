using System;

static class SavingsAccount
{
    public static float InterestRate(decimal balance) =>
        balance switch
        {
            < 0 => -3.213f,
            < 1000 => 0.5f,
            < 5000 => 1.621f,
            _ => 2.475f
        };
    
    private static decimal Interest(decimal balance) =>
        Math.Abs(balance) * ((decimal)InterestRate(balance) / 100);
    
    public static decimal AnnualBalanceUpdate(decimal balance) =>
        balance + Interest(balance);

    public static int YearsBeforeDesiredBalance(decimal balance, decimal targetBalance)
    {
        var years = 0;
        
        while (balance < targetBalance)
        {
            balance = AnnualBalanceUpdate(balance);
            years++;
        }

        return years;
    }
}

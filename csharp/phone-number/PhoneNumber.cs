using System.Linq;

public class PhoneNumber
{
    private const string InvalidPhoneNumber = "0000000000";

    public PhoneNumber(string phoneNumber)
    {
        this.Number = Clean(phoneNumber);
        this.AreaCode = this.Number.Substring(0, 3);
    }

    public string Number { get; private set; }

    public string AreaCode { get; private set; }

    public static string Clean(string phoneNumber)
    {
        var digits = phoneNumber.Where(char.IsDigit).ToArray();

        if (digits.Length == 10)
        {
            return new string(digits);
        }

        if (digits.Length == 11 && digits.First() == '1')
        {
            return new string(digits.Skip(1).ToArray());
        }

        return InvalidPhoneNumber;
    }

    public override string ToString()
    {
        return string.Format("({0}) {1}-{2}", this.AreaCode, this.Number.Substring(3, 3), this.Number.Substring(6, 4));
    }
}
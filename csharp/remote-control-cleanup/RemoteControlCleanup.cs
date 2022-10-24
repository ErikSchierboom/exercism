public class RemoteControlCar
{
    public string CurrentSponsor { get; private set; }
    public CarTelemetry Telemetry { get; }

    private Speed currentSpeed;
        
    public string GetSpeed() => currentSpeed.ToString();

    public RemoteControlCar() => Telemetry = new CarTelemetry(this);

    public class CarTelemetry
    {
        private readonly RemoteControlCar _car;

        public CarTelemetry(RemoteControlCar car) => _car = car;

        public void Calibrate()
        {
        }

        public bool SelfTest() => true;

        public void ShowSponsor(string sponsorName) => SetSponsor(sponsorName);

        public void SetSpeed(decimal amount, string unitsString)
        {
            SpeedUnits speedUnits = SpeedUnits.MetersPerSecond;
            if (unitsString == "cps")
            {
                speedUnits = SpeedUnits.CentimetersPerSecond;
            }

            SetSpeed(new Speed(amount, speedUnits));
        }

        private void SetSponsor(string sponsorName) => _car.CurrentSponsor = sponsorName;

        private void SetSpeed(Speed speed) => _car.currentSpeed = speed;
    }
}

public enum SpeedUnits
{
    MetersPerSecond,
    CentimetersPerSecond
}

public struct Speed
{
    public decimal Amount { get; }
    public SpeedUnits SpeedUnits { get; }

    public Speed(decimal amount, SpeedUnits speedUnits)
    {
        Amount = amount;
        SpeedUnits = speedUnits;
    }

    public override string ToString()
    {
        string unitsString = "meters per second";
        if (SpeedUnits == SpeedUnits.CentimetersPerSecond)
        {
            unitsString = "centimeters per second";
        }

        return Amount + " " + unitsString;
    }
}

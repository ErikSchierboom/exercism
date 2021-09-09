class RemoteControlCar
{
    private int _metersDriven;
    private int _batteryPercentage = 100;
    
    public static RemoteControlCar Buy() => new();

    public string DistanceDisplay() => $"Driven {_metersDriven} meters";

    public string BatteryDisplay() => IsBatteryEmpty ? "Battery empty" : $"Battery at {_batteryPercentage}%";

    public void Drive()
    {
        if (IsBatteryEmpty) return;
        
        _metersDriven += 20;
        _batteryPercentage--;
    }

    private bool IsBatteryEmpty => _batteryPercentage == 0;
}

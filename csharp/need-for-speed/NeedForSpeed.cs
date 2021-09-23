using System;

class RemoteControlCar
{
    private readonly int _speed;
    private readonly int _batteryDrain;
    private int _distanceDriven;
    private int _battery = 100;

    public RemoteControlCar(int speed, int batteryDrain) => (_speed, _batteryDrain) = (speed, batteryDrain);

    public bool BatteryDrained() => _battery == 0;

    public int DistanceDriven() => _distanceDriven;

    public void Drive()
    {
        if (BatteryDrained())
            return;
        
        _distanceDriven += _speed;
        _battery -= _batteryDrain;
    }

    public static RemoteControlCar Nitro() => new(50, 4);
}

class RaceTrack
{
    private readonly int _distance;

    public RaceTrack(int distance) => _distance = distance;

    public bool CarCanFinish(RemoteControlCar car)
    {
        while (!car.BatteryDrained())
            car.Drive();

        return car.DistanceDriven() >= _distance;
    }
}

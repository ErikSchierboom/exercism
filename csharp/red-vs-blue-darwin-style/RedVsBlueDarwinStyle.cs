namespace RedRemoteControlCarTeam
{
    public class RemoteControlCar
    {
        public RemoteControlCar(Motor motor, Chassis chassis, Telemetry telemetry, RunningGear runningGear)
        {
        }
    }

    public class RunningGear
    {
    }

    public class Telemetry
    {
    }

    public class Chassis
    {
    }

    public class Motor
    {
    }
}

namespace BlueRemoteControlCarTeam
{
    public class RemoteControlCar
    {
        public RemoteControlCar(Motor motor, Chassis chassis, Telemetry telemetry)
        {
        }
    }

    public class Telemetry
    {
    }

    public class Chassis
    {
    }

    public class Motor
    {
    }
}

namespace Combined
{
    using Red = RedRemoteControlCarTeam;
    using Blue = BlueRemoteControlCarTeam;
    
    public static class CarBuilder
    {
        public static Red.RemoteControlCar BuildRed() =>
            new(new Red.Motor(), new Red.Chassis(), new Red.Telemetry(), new Red.RunningGear());

        public static Blue.RemoteControlCar BuildBlue() =>
            new(new Blue.Motor(), new Blue.Chassis(), new Blue.Telemetry());
    }
}


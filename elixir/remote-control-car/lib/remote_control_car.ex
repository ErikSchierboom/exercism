defmodule RemoteControlCar do
  @enforce_keys [:nickname]
  defstruct [:nickname, battery_percentage: 100, distance_driven_in_meters: 0]

  def new(nickname \\ "none"), do: %RemoteControlCar{nickname: nickname}

  def display_distance(remote_car) when remote_car.__struct__ == RemoteControlCar do
    "#{remote_car.distance_driven_in_meters} meters"
  end

  def display_battery(remote_car) when remote_car.__struct__ == RemoteControlCar do
    if remote_car.battery_percentage == 0 do
      "Battery empty"
    else
      "Battery at #{remote_car.battery_percentage}%"
    end
  end

  def drive(remote_car) when remote_car.__struct__ == RemoteControlCar do
    if remote_car.battery_percentage == 0 do
      remote_car
    else
      %{
        remote_car
        | battery_percentage: remote_car.battery_percentage - 1,
          distance_driven_in_meters: remote_car.distance_driven_in_meters + 20
      }
    end
  end
end

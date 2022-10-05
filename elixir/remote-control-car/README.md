# Remote Control Car

Welcome to Remote Control Car on Exercism's Elixir Track.
If you need help running the tests or submitting your code, check out `HELP.md`.
If you get stuck on the exercise, check out `HINTS.md`, but try and solve it without using those first :)

## Introduction

## Structs

Structs are an extension built on top of [maps][exercism-maps] which provide compile-time checks and default values. A struct is named after the module it is defined in. To define a struct use the `defstruct` construct. The construct usually immediately follows after the module definition. `defstruct` accepts either a list of atoms (for `nil` default values) or a keyword list (for specified default values). The fields without defaults must precede the fields with default values.

```elixir
defmodule Plane do
  defstruct [:engine, wings: 2]
end

plane = %Plane{}
# => %Plane{engine: nil, wings: 2}
```

### Accessing fields and updating

Since structs are built on maps, we can use most map functions to get and manipulate values. The _Access Behaviour_ is **not** implemented for structs. It is recommended to use the _static access operator_ `.` to access struct fields instead.

- get/fetch field values:

  ```elixir
  plane = %Plane{}
  plane.engine
  # => nil
  Map.fetch(plane, :wings)
  # => 2
  ```

- update field values

  ```elixir
  plane = %Plane{}
  %{plane | wings: 4}
  # => %Plane{engine: nil, wings: 4}
  ```

### Enforcing field value initialization

We can use the `@enforce_keys` module attribute with a list of the field keys to ensure that the values are initialized when the struct is created. If a key is not listed, its value will be `nil` as seen in the above example. If an enforced key is not initialized, an error is raised.

```elixir
defmodule User do
  @enforce_keys [:username]
  defstruct [:username]
end

%User{}
# => (ArgumentError) the following keys must also be given when building struct User: [:username]
```

[exercism-maps]: https://exercism.org/tracks/elixir/concepts/maps

## Instructions

In this exercise you'll be playing around with a remote controlled car, which you've finally saved enough money for to buy.

Cars start with full (100%) batteries. Each time you drive the car using the remote control, it covers 20 meters and drains one percent of the battery. The car's nickname is not known until it is created.

The remote controlled car has a fancy LED display that shows two bits of information:

- The total distance it has driven, displayed as: `"<METERS> meters"`.
- The remaining battery charge, displayed as: `"Battery at <PERCENTAGE>%"`.

If the battery is at 0%, you can't drive the car anymore and the battery display will show `"Battery empty"`.

## 1. Create a brand-new remote controlled car

Implement the `RemoteControlCar.new/0` function to return a brand-new remote controlled car struct:

```elixir
RemoteControlCar.new()
# => %RemoteControlCar{
#      battery_percentage: 100,
#      distance_driven_in_meters: 0,
#      nickname: "none"
#    }
```

The nickname is required by the struct, make sure that a value is initialized in the `new` function, but not in the struct.

## 2. Create a brand-new remote controlled car with a nickname

Implement the `RemoteControlCar.new/1` function to return a brand-new remote controlled car struct with a provided nickname:

```elixir
RemoteControlCar.new("Blue")
# => %RemoteControlCar{
#      battery_percentage: 100,
#      distance_driven_in_meters: 0,
#      nickname: "Blue"
#    }
```

## 3. Display the distance

Implement the `RemoteControlCar.display_distance/1` function to return the distance as displayed on the LED display:

```elixir
car = RemoteControlCar.new()
RemoteControlCar.display_distance(car)
# => "0 meters"
```

Make sure the function only accepts a `RemoteControlCar` struct as the argument.

## 4. Display the battery percentage

Implement the `RemoteControlCar.display_battery/1` function to return the battery percentage as displayed on the LED display:

```elixir
car = RemoteControlCar.new()
RemoteControlCar.display_battery(car)
# => "Battery at 100%"
```

Make sure the function only accepts a `RemoteControlCar` struct as the argument. If the battery is at 0%, the battery display will show "Battery empty".

## 5. Driving changes the battery and distance driven

Implement the `RemoteControlCar.drive/1` function that:

- updates the number of meters driven by 20
- drains 1% of the battery

```elixir
RemoteControlCar.new("Red")
|> RemoteControlCar.drive()
# => %RemoteControlCar{
#      battery_percentage: 99,
#      distance_driven_in_meters: 20,
#      nickname: "Red"
#    }

```

Make sure the function only accepts a `RemoteControlCar` struct as the argument.

## 6. Account for driving with a dead battery

Update the `RemoteControlCar.drive/1` function to not increase the distance driven nor decrease the battery percentage when the battery is drained (at 0%):

```elixir
%RemoteControlCar{
  battery_percentage: 0,
  distance_driven_in_meters: 1980,
  nickname: "Red"
}
|> RemoteControlCar.drive()
# => %RemoteControlCar{
#      battery_percentage: 0,
#      distance_driven_in_meters: 1980,
#      nickname: "Red"
#    }
```

## Source

### Created by

- @neenjaw

### Contributed to by

- @angelikatyborska
defmodule LibraryFees do
  def datetime_from_string(string), do: NaiveDateTime.from_iso8601!(string)

  def before_noon?(datetime), do: datetime.hour < 12

  def return_date(checkout_datetime) do
    checkout_in_days = if(before_noon?(checkout_datetime), do: 28, else: 29)

    checkout_datetime
    |> NaiveDateTime.to_date()
    |> Date.add(checkout_in_days)
  end

  def days_late(planned_return_date, actual_return_datetime) do
    max(Date.diff(actual_return_datetime, planned_return_date), 0)
  end

  def monday?(datetime), do: Date.day_of_week(datetime) == 1

  def calculate_late_fee(checkout, return, rate) do
    checkout_date = datetime_from_string(checkout)
    actual_return_date = datetime_from_string(return)
    planned_return_date = return_date(checkout_date)
    days_late = days_late(planned_return_date, actual_return_date)
    discount_divisor = if(monday?(actual_return_date), do: 2, else: 1)
    div(days_late * rate, discount_divisor)
  end
end

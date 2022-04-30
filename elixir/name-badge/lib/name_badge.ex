defmodule NameBadge do
  def print(id, name, department) do
    department = String.upcase(department || "OWNER")

    if id do
      "[#{id}] - #{name} - #{department}"
    else
      "#{name} - #{department}"
    end
  end
end

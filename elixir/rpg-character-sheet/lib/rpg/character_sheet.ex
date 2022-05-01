defmodule RPG.CharacterSheet do
  def welcome() do
    IO.puts("Welcome! Let's fill out your character sheet together.")
  end

  def ask_name() do
    IO.gets("What is your character's name?\n")
    |> String.trim()
  end

  def ask_class() do
    IO.gets("What is your character's class?\n")
    |> String.trim()
  end

  def ask_level() do
    IO.gets("What is your character's level?\n")
    |> String.trim()
    |> Integer.parse()
    |> elem(0)
  end

  def run() do
    welcome()
    name = ask_name()
    class = ask_class()
    level = ask_level()
    IO.inspect(%{class: class, level: level, name: name}, label: "Your character")
  end
end

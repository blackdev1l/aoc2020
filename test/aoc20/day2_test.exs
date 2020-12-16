defmodule Aoc20.Day2Test do
  use ExUnit.Case
  doctest Aoc20.Day2

  alias Aoc20.Day2

  @data_dir Path.join([Application.app_dir(:aoc20), "priv", "day2"])

  test "part one" do
    input = File.stream!(Path.join(@data_dir, "input"))
    combination = Day2.parse("6-7 w: wkjnmww")
    assert "6" == combination["min"]
    assert "7" == combination["max"]
    assert "w" == combination["letter"]
    assert "wkjnmww" == combination["password"]
    assert 2 == Day2.read(["1-3 a: abcde", "1-3 b: cdefg", "2-9 c: ccccccccc"], :old_policy)

    assert 564 == Day2.read(input, :old_policy)
  end

  test "part two" do
    assert 1 == Day2.read(["1-3 a: abcde", "1-3 b: cdefg", "2-9 c: ccccccccc"], :new_poliicy)
    assert 325 == Day2.read(input, :new_policy)
  end
end

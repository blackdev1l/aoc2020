defmodule Aoc20.Day1Test do
  use ExUnit.Case
  doctest Aoc20.Day1

  alias Aoc20.Day1

  @data_dir Path.join([Application.app_dir(:aoc20), "priv", "day1"])

  setup_all do
    reports =
      for line <- File.stream!(Path.join(@data_dir, "input")),
          {number, _new_line} = Integer.parse(line) do
        number
      end

    {:ok, reports: reports}
  end

  test "part one", %{reports: reports} do
    assert "world" == Day1.hello()
    assert 514579 == Day1.findEntries([1721,979,366,299,675,1456])
    assert 5 == Day1.findSum([5,100,12,340],2015)
    assert 902451 == Day1.findEntries(reports)
  end


  test "part two", %{reports: reports} do
  end
end


require IO
require Enum

defmodule Aoc20.Day2 do
  @moduledoc """
  To try to debug the problem, they have created a list (your puzzle input) of passwords (according to the corrupted database) and the corporate policy when that password was set.

  For example, suppose you have the following list:

  1-3 a: abcde
  1-3 b: cdefg
  2-9 c: ccccccccc

  Each line gives the password policy and then the password. The password policy indicates the lowest and highest number of times a
  given letter must appear for the password to be valid. For example, 1-3 a means that the password must contain a at least 1 time and at most 3 times.

  In the above example, 2 passwords are valid. The middle password, cdefg, is not; it contains no instances of b, but needs at least 1.
   The first and third passwords are valid: they contain one a or nine c, both within the limits of their respective policies.

  How many passwords are valid according to their policies?
  """

  def read(passwords) do
    passwords
    |> Enum.map(&parse/1)
    |> Enum.filter(&checkPolicy/1)
    |> Enum.count()
  end

  def parse(policy) do
    Regex.named_captures(
      ~r/(?<min>\d+)-(?<max>(\d+)) (?<letter>[\w]): (?<password>[\w]+)/,
      policy
    )
  end

  def checkPolicy(policy) do
    count =
      String.splitter(policy["password"], "")
      |> Enum.filter(&(&1 == policy["letter"]))
      |> Enum.count()

    count >= String.to_integer(policy["min"]) && count <= String.to_integer(policy["max"])
  end
end

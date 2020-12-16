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

  def read(passwords, policy_type) do
    passwords
    |> Enum.map(&parse/1)
    |> Enum.filter(&check_policy(&1, policy_type))
    |> Enum.count()
  end

  def parse(policy) do
    Regex.named_captures(
      ~r/(?<min>\d+)-(?<max>(\d+)) (?<letter>[\w]): (?<password>[\w]+)/,
      policy
    )
  end

  def check_policy(policy, policy_type) do
    password = policy["password"]
    min = String.to_integer(policy["min"])
    max = String.to_integer(policy["max"])
    letter = policy["letter"]

    if policy_type == :old_policy do
      count =
        String.splitter(password, "")
        |> Enum.filter(&(&1 == letter))
        |> Enum.count()

      count >= min && count <= max
    else
      !(String.at(password, min - 1) == letter == (String.at(password, max - 1) == letter))
    end
  end
end

require IO
require Enum
defmodule Aoc20.Day1 do
  @moduledoc """
  Before you leave, the Elves in accounting just need you to fix your expense report (your puzzle input); apparently, something isn't quite adding up.
  Specifically, they need you to find the two entries that sum to 2020 and then multiply those two numbers together.
  For example, suppose your expense report contained the following:

    1721
    979
    366
     9
    675
    1456

  In this list, the two entries that sum to 2020 are 1721 and 299. Multiplying them together produces 1721 * 299 = 514579, so the correct answer is 514579.

  Permuto ogni elemento della lista finchè non troovo la coppai che sommata fa 2020
  per cui :
    per ogni elemento in lista
      sommo quell'elemento per ogni altro elemento nella lista
        se trovo la combinazione ritorno e moltiplcio
        altrimenti rimuovo quell'elemento e ripeto
   """

  def hello do
    "world"
  end

  def findEntries(list) do
    Enum.flat_map(list, fn x -> [x *findSum(list,x)] end)
    |> Enum.filter(fn x -> x != 0 end)
    |> List.first
  end

  def findSum(list, elem) do
    Enum.find(list,0, fn x ->
      if elem + x == 2020 do
        true
      end
    end)
  end
end

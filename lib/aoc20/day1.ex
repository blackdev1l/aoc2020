require IO
require Enum

defmodule Aoc20.Day1 do
  @moduledoc """

   --- part 1 ---
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

  --- Part 2 ---

   The Elves in accounting are thankful for your help; one of them even offers you a starfish coin they had left over from a past vacation.
   They offer you a second one if you can find three numbers in your expense report that meet the same criteria.

   Using the above example again, the three entries that sum to 2020 are 979, 366, and 675. Multiplying them together produces the answer, 241861950.

   In your expense report, what is the product of the three entries that sum to 2020?

   prendo la prima
  """

  def hello do
    "world"
  end

  def findEntries(list) do
    Enum.flat_map(list, fn x -> [x * findSum(list, x)] end)
    |> Enum.filter(fn x -> x != 0 end)
    |> List.first()
  end

  def findSum(list, elem) do
    Enum.find(list, 0, fn x ->
      if elem + x == 2020 do
        true
      end
    end)
  end

  def find_entries(list) do
    Enum.reduce_while(list, 0, fn x, _x_acc ->
      rs =
        Enum.reduce_while(list, 0, fn y, _acc ->
          result =
            Enum.reduce_while(list, 0, fn z, _acc ->
              if x + y + z == 2020 do
                IO.puts("#{x} #{y} #{z} ")
                IO.puts("#{x * y * z}")
                {:halt, x * y * z}
              else
                {:cont, 0}
              end
            end)

          if result != 0 do
            {:halt, result}
          else
            {:cont, 0}
          end
        end)

      if rs != 0 do
        {:halt, rs}
      else
        {:cont, 0}
      end
    end)
  end
end

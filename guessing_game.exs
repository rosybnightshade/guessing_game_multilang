defmodule Game do
  def start do
    random_number = :rand.uniform(200)
    userguess(random_number, 1)
  end
  def userguess(random_number, attempts) do
    guess =
      IO.gets("Enter a Number Between 0-200: ")
      |> String.trim()
      |> String.to_integer()
    cond do
      guess == random_number ->
        IO.puts("You guessed the number in #{attempts} attempts!")
      guess > random_number ->
        IO.puts("Too High")
        userguess(random_number, attempts + 1)
      guess < random_number ->
        IO.puts("Too Low")
        userguess(random_number, attempts + 1)
    end
  end
end
Game.start()

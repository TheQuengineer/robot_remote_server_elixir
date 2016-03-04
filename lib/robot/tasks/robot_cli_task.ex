defmodule Mix.Tasks.Robot do
  @moduledoc """
  Tasks to begin the robot remote server process.
  Entering command:

  ```
  mix RobotCLI
  ```
  Robot Remote server dialog will start
  """
  use Mix.Task

  @shortdoc "Initializes Robot Remote Server dialog"

  def run(_args) do
    prompt
  end


  ###########
  # HELPERS #
  ###########
  defp prompt do
    answer = IO.gets(question)
    answer
    |> String.strip(?\n)
    |> process
  end

  defp accepted_yes_answers do
    [
      "yes",
      "Yes",
      "YES",
      "Y",
      "y"
    ]
  end

  defp question do
    "Do you wish to start the robot remote server? [y/n] > "
  end

  defp yes_answer?(answer) do
    if answer in accepted_yes_answers, do: true, else: false
  end

  defp process(answer) do
    if yes_answer?(answer) do
      IO.puts("Initiating the robot remote server....")
      RobotRemoteServerElixir.start([],[])
    else
      IO.puts("Goodbye... for now.......")
      Process.exit(self, :normal)
    end
  end
end

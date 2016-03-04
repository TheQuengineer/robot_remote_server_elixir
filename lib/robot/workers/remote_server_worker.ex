defmodule Robot.Workers.RemoteServerWorker do
  @moduledoc """
  The Main Worker for the robot remote server
  """
  use GenServer

  def start do
    IO.puts("Server started at http://100.123.1234")
    #GenServer.start_link(__MODULE__, :ok, [name: __MODULE__])
  end

  # def init(:ok) do
  #   IO.puts("Server started at http://100.123.1234")
  # end
end

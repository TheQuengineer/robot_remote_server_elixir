defmodule Robot.Supervisors.RemoteServerSupervisor do
@moduledoc """
  Supervises the Robot Remote Server worker process.
"""
  use Supervisor

  def start do
    Supervisor.start_link(__MODULE__, :ok, [name: RemoteServerSupervisor])
  end


  def init(:ok) do
    children = [
      worker(Robot.Workers.RemoteServerWorker, [8270], [function: :start])
    ]

    options = [
      strategy: :one_for_one
    ]

    supervise(children, options)
  end
end

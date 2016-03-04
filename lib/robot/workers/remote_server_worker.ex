defmodule Robot.Workers.RemoteServerWorker do
  @moduledoc """
  The Main Worker for the robot remote server
  """

  require Logger

  def start(port) do
    options = [
      :binary,
      packet: :line,
      active: false,
      reuseaddr: true
    ]
    {:ok, socket} = :gen_tcp.listen(port, options)
    Logger.info("Initiaiting Robot Framework requests on port #{port}")
    loop(socket)
  end

  defp loop(socket) do
    {:ok, client} = :gen_tcp.accept(socket)
    serve(client)
    loop(socket)
  end

  defp serve(socket) do
    IO.puts(inspect(socket))
    # |> read_request
    # |> reply
  end

  # defp read_request(socket) do
  #   {:ok, data} = :gen_tcp.recv(socket, 0)
  #   Robot.ProtocolHandlers.XMLRPC.process_request_body(data)
  # end
  #
  # defp reply(socket, message) do
  #   gen_tcp.send(socket, message)
  # end
end

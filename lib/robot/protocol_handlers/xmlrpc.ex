defmodule Robot.ProtocolHandlers.XMLRPC do
  @moduledoc """
  Resposible for Encoding and Decoding the XML-RPC requests and
  responses coming from the Robot Framework
  """
  use HTTPoison.Base

  def process_request_body(body), do: XMLRPC.encode(body)
  def process_response_body(body), do: XMLRPC.decode(body)
end

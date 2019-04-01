defmodule GenPhoenix.Server do
  defmacro __using__(_opts) do
    quote do
      import Plug.Conn, only: [send_resp: 3]
      @behaviour GenPhoenix.Server.Behaviour

      def call(conn, params) do
        case execute(params) do
          {:reply, resp} ->
            respond(conn, resp)

          :noreply ->
            send_resp(conn, 200, "")
        end
      end

      def respond(conn, resp) do
        send_resp(conn, 200, Poison.encode!(resp))
      end

      defoverridable respond: 2
    end
  end

  defmodule Behaviour do
    @moduledoc """
    Behaviour to implement by the servers
    """

    @callback execute(map()) :: {:reply, any()} | :noreply
    @callback respond(Plug.Conn.t(), map()) :: Plug.Conn.t()
  end
end

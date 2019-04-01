defmodule GenPhoenix.Server do
  def __using__(opts) do
    mod = Keyword.get(opts, :module)

    quote do
      use unquote(mod), :controller

      @behaviour GenPhoenix.Server.Behaviour

      def call(conn, params) do
        case execute(params) do
          {:reply, resp} -> nil
          :noreply -> nil
        end
      end
    end
  end

  defmodule Behaviour do
    @moduledoc """
    Behaviour to implement by the servers
    """

    @callback execute(map()) :: {:reply, any()} | :noreply
  end
end

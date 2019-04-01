defmodule GenPhoenix do
  defmodule Behaviour do
    @moduledoc """
    Behaviour to implement by the servers
    """

    @callback execute(any()) :: {:reply, any()} | :noreply

    @callback handle(any()) :: {:reply, any()} | :noreply
  end

  def __using__(opts) do
    mod = Keyword.get(opts, :module)

    quote do
      use unquote(mod), :controller

      @behaviour GenPhoenix.Server.Behaviour

      def call(data) do
      end

      defoverridable handle: 1
    end
  end
end

defmodule GenPhoenix.TestServer do
  defmodule WithResponse do
    use GenPhoenix.Server

    def execute(_data) do
      {:reply, %{name: "demo"}}
    end
  end

  defmodule NoResponse do
    use GenPhoenix.Server

    def execute(_data) do
      :noreply
    end
  end
end

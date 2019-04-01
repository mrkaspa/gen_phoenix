defmodule GenPhoenixTest do
  use ExUnit.Case
  doctest GenPhoenix

  test "greets the world" do
    assert GenPhoenix.hello() == :world
  end
end

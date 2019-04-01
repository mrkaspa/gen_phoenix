defmodule GenPhoenix.ServerTest do
  use ExUnit.Case

  setup do
    conn = Plug.Test.conn(:get, "/")
    {:ok, conn: conn}
  end

  test "should respond", %{conn: conn} do
    resp = Poison.encode!(%{name: "demo"})

    assert %Plug.Conn{resp_body: ^resp, status: 200} =
             GenPhoenix.TestServer.WithResponse.call(conn, %{})
  end

  test "should not respond", %{conn: conn} do
    assert %Plug.Conn{resp_body: "", status: 200} =
             GenPhoenix.TestServer.NoResponse.call(conn, %{})
  end
end

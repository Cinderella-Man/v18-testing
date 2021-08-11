defmodule MyAppTest do
  use ExUnit.Case

  import Mox

  setup :set_mox_from_context
  setup :verify_on_exit!

  test "Increments the counter" do
    FileMock
    |> expect(:write!, fn _path, "1" -> :ok end)

    {:ok, pid} = MyApp.start_link(0)
    assert 1 == GenServer.call(pid, :inc)
  end
end

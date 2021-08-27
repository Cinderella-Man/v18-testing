defmodule MyAppTest do
  use ExUnit.Case

  test "Increments the counter" do
    {:ok, pid} =
      MyApp.start_link(
        {0,
         %{
           storage_write: fn _path, "1" -> :ok end
         }}
      )

    assert 1 == GenServer.call(pid, :inc)
  end
end

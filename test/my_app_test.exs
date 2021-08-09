defmodule MyAppTest do
  use ExUnit.Case

  test "Increments the counter" do
    {:ok, pid} = MyApp.start_link(0)

    assert 1 ==
             MyApp.increment_accumulator(
               pid,
               fn _path, "1" -> :ok end
             )
  end
end

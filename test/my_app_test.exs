defmodule MyAppTest do
  use ExUnit.Case

  test "Increments the counter" do
    assert 1 == MyApp.increment_accumulator(
      0,
      fn (_path, "1") -> :ok end
    )
  end
end

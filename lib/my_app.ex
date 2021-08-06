defmodule MyApp do
  use GenServer

  def start_link(acc) do
    GenServer.start_link(__MODULE__, acc)
  end

  def init(acc) do
    {:ok, acc}
  end

  def handle_call(:inc, _from, acc) do
    acc = increment_accumulator(acc)
    {:reply, acc, acc}
  end

  def increment_accumulator(acc, write_fun \\ &File.write!/3) do
    :ok = write_fun.("cache.txt", to_string(acc + 1))
    acc + 1
  end
end

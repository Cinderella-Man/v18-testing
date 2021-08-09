defmodule MyApp do
  use GenServer

  def start_link(acc) do
    GenServer.start_link(__MODULE__, acc)
  end

  def init(acc) do
    {:ok, acc}
  end

  def handle_call({:inc, write_fun}, _from, acc) do
    :ok = write_fun.("cache.txt", to_string(acc + 1))
    {:reply, acc + 1, acc + 1}
  end

  def increment_accumulator(pid, write_fun \\ &File.write!/3) do
    GenServer.call(pid, {:inc, write_fun})
  end
end

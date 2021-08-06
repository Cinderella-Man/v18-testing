defmodule MyApp do
  use GenServer

  def start_link(args) do
    GenServer.start_link(__MODULE__, args)
  end

  def init({data, context}) do
    storage_write = Map.get(context, :storage_write, &File.write!/3)
    {:ok, {data, %{storage_write: storage_write}}}
  end

  def handle_call(:inc, _from, {acc, context}) do
    :ok = context.storage_write.("cache.txt", to_string(acc + 1))
    {:reply, acc + 1, {acc + 1, context}}
  end
end

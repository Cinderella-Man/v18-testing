defmodule MyApp do
  use GenServer

  @storage Application.get_env(:my_app, :storage)

  def start_link(acc) do
    GenServer.start_link(__MODULE__, acc)
  end

  def init(acc) do
    {:ok, acc}
  end

  def handle_call(:inc, _from, acc) do
    :ok =
      @storage.write!(
        "cache.txt",
        to_string(acc + 1)
      )

    {:reply, acc + 1, acc + 1}
  end
end

defmodule MyApp.Test do
  defmodule StorageBehaviour do
    @type path :: binary
    @type content :: binary

    @callback write!(path, content) :: :ok
  end
end

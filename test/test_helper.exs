ExUnit.start()

Application.ensure_all_started(:mox)

Mox.defmock(FileMock, for: MyApp.Test.StorageBehaviour)

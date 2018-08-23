defmodule App do
  use Application
  import Supervisor.Spec

  def start(_type, _args) do
    # Similarly to ExUnit, creating workers twice the number of cores
    children = 1..System.schedulers_online * 2
               |> Enum.map(fn i -> worker(App.Worker, [], id: "worker_#{i}") end)

    # Terminating all children with no restart when an exception happens
    Supervisor.start_link(children, strategy: :one_for_all, max_restarts: 0)
  end
end

defmodule App.Worker do
  use GenServer

  def start_link do
    GenServer.start_link(__MODULE__, [])
  end

  def init(_) do
    # Starting the initial iteration
    Kernel.send(self(), :hash)
    {:ok, {}}
  end

  def handle_info(:hash, state) do
    Bcrypt.hash_pwd_salt("some_password", log_rounds: 4)
    |> IO.inspect

    # Repeat until crash
    Kernel.send(self(), :hash)
    {:noreply, state}
  end
end

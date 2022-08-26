defmodule Supsup.Extension do
  use Supervisor, restart: :temporary

  @spec start_link(list()) :: {:error, any} | {:ok, pid}
  def start_link(args) do
    Supervisor.start_link(__MODULE__, args, name: __MODULE__)
  end

  def start_extention() do
    # couldn't figure out how to pass a chid spec here so I defined the :restart in `use Supervisor`
    DynamicSupervisor.start_child(Supsup.DynamicSupervisor, __MODULE__)
  end

  @impl true
  def init(_args) do
    children = [
      Supervisor.child_spec({Supsup.Extension.Child, [name: :one]}, id: :one),
      Supervisor.child_spec({Supsup.Extension.Child, [name: :two]}, id: :two),
      Supervisor.child_spec({Supsup.Extension.Child, [name: :three]}, id: :three)
    ]

    Supervisor.init(children,
      strategy: :one_for_all,
      max_restarts: 10,
      max_seconds: 60
    )
  end
end

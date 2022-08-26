# Supsup

Example supervision tree where an application supervises a DynamicSupervisor. Then Extension supervision trees are started and stopped on demand.

```
# start an extension
Supsup.Extension.start_extention()

# an extension child process is blocking all calls
GenServer.call(:one, :respond)

# get the pid of the extension Supervisor and shut it down with it's child process even though they are blocking
[{:undefined, pid, :supervisor, [Supsup.Extension]}] = DynamicSupervisor.which_children(Supsup.DynamicSupervisor)
Supervisor.stop(pid)
```

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `supsup` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:supsup, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at <https://hexdocs.pm/supsup>.

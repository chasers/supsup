defmodule Supsup.Extension.Child do
  use GenServer

  @impl true
  def init(stack) do
    Process.send_after(self(), :sleep, 0)
    {:ok, stack}
  end

  # Start the server
  def start_link(stack) do
    GenServer.start_link(__MODULE__, [], name: stack[:name])
  end

  @impl true
  def handle_info(:sleep, state) do
    Process.sleep(60_000)
    {:noreply, state}
  end

  @impl true
  def handle_call(:respond, _from, state) do
    {:reply, :ok, state}
  end
end

defmodule LMM.Periodically do
  use GenServer

  def start_link(_opts) do
    GenServer.start_link(__MODULE__, %{})
  end

  def init(state) do
    schedule_work()
    {:ok, state}
  end

  def handle_info(:work, state) do
    word = :httpc.request(:get, {'https://trouve-mot.fr/api/size/5', []}, [], [])
    res = List.first(Jason.decode!(elem(elem(word, 1), 2)))
    name = Map.get(res, "name")
    File.write("daily.txt", name)
    schedule_work()
    {:noreply, state}
  end

  defp schedule_work() do
    Process.send_after(self(), :work, 24 * 60 * 60 * 1000)
  end
end

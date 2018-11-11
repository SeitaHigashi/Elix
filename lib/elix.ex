defmodule Elix do
  def start do
    import Supervisor.Spec

    children = for i <- 1..System.schedulers_online, do: worker(ElixCore, [], id: i)

    Supervisor.start_link(children, strategy: :one_for_one)
  end
end

defmodule ElixCore do
  use Nostrum.Consumer

  alias Nostrum.Api

  require Logger

  def start_link do
    Consumer.start_link(__MODULE__)
  end

  def handle_event(_, state) do
    {:ok, state}
  end
end

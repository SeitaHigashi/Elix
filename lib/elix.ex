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

  @botname Application.get_env(:elix, :botname, "Elix")

  def start_link do
    Consumer.start_link(__MODULE__)
  end

  def handle_event({:MESSAGE_CREATE, {msg}, _ws_state}, state) do
    { _ , %{ "id" => current_id}} = Api.get_current_user
    message = msg.content |> String.split
    if msg.author.id != current_id do
      Api.create_message(msg.channel_id, response(message, msg))
    end
    {:ok, state}
  end

  def handle_event(_, state) do
    {:ok, state}
  end

  def response([ @botname | command ], msg) do
    responsetype command, msg
  end

  def response(_, _), do: ""

  def responsetype([type | command], msg) do
    case type do
      "get" -> responsecommand command, msg
    end
  end

  def responsetype(_, _msg), do: ""

  def responsecommand([command | _], msg) do
    case command do
      "channel_id" -> msg.channel_id |> Integer.to_string
    end
  end

  def responsecommand(_, _msg), do: "There is no command"
end

defmodule Elix.Core do
  use Nostrum.Consumer

  alias Nostrum.Api

  require Logger

  @botname Application.get_env(:elix, :botname, "Elix")

  def start_link, do: Consumer.start_link(__MODULE__)

  def handle_event({:MESSAGE_CREATE, {msg}, _ws_state}, state) do
    { _ , %{ "id" => current_id}} = Api.get_current_user
    message = msg.content |> String.split
    if msg.author.id != current_id do
      Api.create_message(msg.channel_id, response(message, msg))
    end
    {:ok, state}
  end

  def handle_event(_, state), do: {:ok, state}

  def response([ @botname | command ], msg), do: Elix.Response.response command, msg
  def response(_, _), do: ""


end

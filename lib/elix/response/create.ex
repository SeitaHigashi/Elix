defmodule Elix.Response.Create do

  def response([ "message" | message], _msg), do: message(message)
  def response(["channel" | message], msg), do: channel(message, msg)
  def response([_command | _message], _msg), do: "It does not match the command"

  def message([head | tail]), do: head <> "" <> message tail
  def message([]), do: ""

  def channel([channel_name | _option], msg) do
    guild_id = Elix.Response.Get.response(["guild_id"], msg) |> String.to_integer
    { succesful , _ } = Nostrum.Api.create_channel(guild_id, %{name: channel_name})
    succesful |> Atom.to_string
  end
end

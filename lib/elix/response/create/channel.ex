defmodule ElixCreateChannel do
  def create_channel([channel_name | _option], msg) do
    guild_id = ElixGet.response_get(["guild_id"], msg) |> String.to_integer
    { succesful , _ } = Nostrum.Api.create_channel(guild_id, %{name: channel_name})
    succesful |> Atom.to_string
  end
end

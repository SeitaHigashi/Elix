defmodule Elix.Response.Create.Channel do
  def create_channel([channel_name | _option], msg) do
    guild_id = Elix.Response.Get.response(["guild_id"], msg) |> String.to_integer
    { succesful , _ } = Nostrum.Api.create_channel(guild_id, %{name: channel_name})
    succesful |> Atom.to_string
  end
end

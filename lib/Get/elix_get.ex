defmodule ElixGet do

  def response_get(["channel_id" | _message], msg), do: msg.channel_id |> Integer.to_string
  def response_get(["botname" | _message], _msg), do: "I'm " <> Application.get_env(:elix, :botname, "Elix")
  def response_get(["guild_id" | _message], msg) do
    { _, result } = msg.channel_id |> Nostrum.Cache.Mapping.ChannelGuild.get_guild
    result |> Integer.to_string
  end

  def response_get([_command | _message], _msg), do: "It does not match the command"

  def response_get(_, _msg), do: "There is no command"
end

defmodule Elix.Response.Get do
  def response(["channel_id" | _message], msg), do: msg.channel_id |> Integer.to_string
  def response(["botname" | _message], _msg), do: "I'm " <> Application.get_env(:elix, :botname, "Elix")
  def response(["guild_id" | _message], msg), do: guild_id msg
  def response(["version" | _message], _msg), do: Mix.Project.config[:version]
  def response([_command | _message], _msg), do: "It does not match the command"
  def response(_, _msg), do: "There is no command"

  def guild_id(msg) do
    { _ , result} = msg.channel_id |> Nostrum.Cache.Mapping.ChannelGuild.get_guild
    result |> Integer.to_string
  end
end

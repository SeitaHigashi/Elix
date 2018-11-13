defmodule Elix.Response.Get do
  def response(["channel_id" | _message], msg), do: msg.channel_id |> Integer.to_string
  def response(["botname" | _message], _msg), do: "I'm " <> Application.get_env(:elix, :botname, "Elix")
  def response(["guild_id" | _message], msg), do: Elix.Response.Get.GuildID.get_guild_id msg
  def response(["guild_members" | _message], msg), do: Elix.Response.Get.GuildMember.get_guild_member msg
  def response(["version" | _message], _msg), do: Elix.Response.Get.Version.get_version
  def response([_command | _message], _msg), do: "It does not match the command"
  def response(_, _msg), do: "There is no command"
end

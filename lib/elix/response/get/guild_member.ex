defmodule Elix.Response.Get.GuildMember do
    def get_guild_member(msg) do
        #guild_id = ElixGetGuildID.get_guild_id(msg) |> String.to_integer
        #{:ok, members} = Nostrum.Api.get_guild_members(guild_id, [])
        #ElixConvertion.to_string members
        ""
    end
end
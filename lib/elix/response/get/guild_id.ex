defmodule Elix.Response.Get.GuildID do
    def get_guild_id(msg) do
        { _ , result} = msg.channel_id |> Nostrum.Cache.Mapping.ChannelGuild.get_guild
        result |> Integer.to_string
    end
end
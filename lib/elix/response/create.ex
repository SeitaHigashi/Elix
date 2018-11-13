defmodule Elix.Response.Create do

  def response([ "message" | message], _msg), do: Elix.Response.Create.Message.create_message(message)
  def response(["channel" | message], msg), do: Elix.Response.Create.Channel.create_channel(message, msg)
  def response([_command | _message], _msg), do: "It does not match the command"

end

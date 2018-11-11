defmodule ElixCreate do

  def response_create([ "message" | message], _msg), do: ElixCreateMessage.create_message(message)
  def response_create([_command | _message], _msg), do: "It does not match the command"

end

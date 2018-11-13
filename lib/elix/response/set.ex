defmodule Elix.Response.Set do
  def response([_command | _message], _msg), do: "It does not match the command"
  def response(_, _msg), do: "There is no command"
end

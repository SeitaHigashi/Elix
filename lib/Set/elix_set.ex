defmodule ElixSet do
  def response_set([_command | _message], _msg), do: "It does not match the command"
  def response_set(_, _msg), do: "There is no command"
end

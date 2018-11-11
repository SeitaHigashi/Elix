defmodule ElixCoreCreate do
  def response_create([command | message], _msg) do
    case command do
      "message" -> create_message(message)
      _ -> "It does not match the command"
    end
  end

  def create_message([head | tail]), do: head <> " " <> create_message tail
  def create_message([]), do: ""
end

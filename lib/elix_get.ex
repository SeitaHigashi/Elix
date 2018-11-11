defmodule ElixCoreGet do
 def response_get([command | _], msg) do
    case command do
      "channel_id" -> msg.channel_id |> Integer.to_string
      _ -> "It does not match the command"
    end
  end

  def response_get(_, _msg), do: "There is no command"
end

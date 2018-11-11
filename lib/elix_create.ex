defmodule ElixCoreCreate do
  def response_create([command | message], _msg) do
    case command do
      _ -> "It does not match the command"
    end
  end
end

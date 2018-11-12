defmodule ElixConvertion do
    def to_string([ %{user: user} | tail ]), do: user.username <> ElixConvertion.to_string tail
    def to_string([]), do: ""
    def to_string(_), do: ""
end
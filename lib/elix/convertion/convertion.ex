defmodule Elix.Convertion do
    def to_string([ %{user: user} | tail ]), do: user.username <> Elix.Convertion.to_string tail
    def to_string([]), do: ""
    def to_string(_), do: ""
end
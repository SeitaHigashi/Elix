defmodule Elix.Convertion do
    def to_string([ %{user: user} | tail ]), do: user.username <> Elix.Convertion.to_string tail
    def to_string([]), do: ""
    def to_string(_), do: ""

    def to_messageformat(message) do
        message |> String.split |> countmessage
    end
    def countmessage([str | message], count \\ 0) do
        cond do
            String.length(str) + count < 20 ->
                [ a | b ] = countmessage(message, String.length(str) + count + 1)
                [ str <> " " <> a | b ]
            true ->
                msg = countmessage(message, 0)
                [ str | msg]
        end
    end
    def countmessage([], _ ), do: [""]
end

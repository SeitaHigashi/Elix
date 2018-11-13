defmodule Elix.Response.Create.Message do
  def create_message([head | tail]), do: head <> " " <> create_message tail
  def create_message([]), do: ""
end

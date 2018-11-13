defmodule Elix.Response do
    def response(["get" | command], msg), do: Elix.Response.Get.response command, msg
    def response(["create" | command], msg), do: Elix.Response.Create.response command, msg
    def response(["set" | command], msg), do: Elix.Response.Set.response command, msg
    def response([_type | _command], _msg), do: "It does no match the type"
    def response(_, _msg), do: "There is no type"
end
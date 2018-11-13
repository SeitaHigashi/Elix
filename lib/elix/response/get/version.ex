defmodule Elix.Response.Get.Version do
    def get_version do
        Mix.Project.config[:version] 
    end
end
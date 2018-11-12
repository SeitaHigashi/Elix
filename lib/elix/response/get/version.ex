defmodule ElixGetVersion do
    def get_version do
        Mix.Project.config[:version] 
    end
end
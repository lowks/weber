defmodule Cowboy do
    
    @moduledoc """
        Starts cowboy instance.
    """

    def start(name, config) do
        :application.start(:crypto)
        :application.start(:ranch)
        :application.start(:cowlib)
        :application.start(:cowboy)
        
        dispatch = :cowboy_router.compile([{:_, [{:_, Handler.WeberReqHandler, name}]}])
        {:ok, _} = :cowboy.start_http(:http, 100, [port: 8080], [env: [dispatch: dispatch]])
    end
end
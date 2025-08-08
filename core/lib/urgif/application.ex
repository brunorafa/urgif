defmodule Urgif.Application do
  use Application

  def start(_type, _args) do
    children = [
      {Plug.Cowboy, scheme: :http, plug: Urgif.Router, options: [port: 4077]}
    ]

    opts = [strategy: :one_for_one, name: Urgif.Supervisor]
    Supervisor.start_link(children, opts)
  end
end

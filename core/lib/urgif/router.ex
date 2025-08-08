defmodule Urgif.Router do
  use Plug.Router

  plug :match
  plug :dispatch

  get "/socket" do
    conn
    |> put_resp_header("upgrade", "websocket")
    |> put_resp_header("connection", "upgrade")
    |> upgrade_adapter(:websocket, {Urgif.SocketHandler, %{}, %{}})
  end

  match _ do
    send_resp(conn, 404, "Not found")
  end
end

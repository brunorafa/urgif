defmodule Urgif.SocketHandler do
  @behaviour :cowboy_websocket

  def init(req, state) do
    {:cowboy_websocket, req, state}
  end

  def websocket_init(state) do
    IO.puts("Client connected")
    {:ok, state}
  end

  def websocket_handle({:text, data}, state) do
    case Jason.decode(data) do
      {:ok, %{"action" => "search", "term" => term} = message} ->
        limit = Map.get(message, "limit", 10)
        results = Urgif.GifService.search(term, limit)
        response = Jason.encode!(%{"action" => "results", "gifs" => results})
        {:reply, {:text, response}, state}

      {:ok, %{"action" => "share", "gif_id" => gif_id, "search_term" => search_term}} ->
        Urgif.GifService.register_share(gif_id, search_term)
        response = Jason.encode!(%{"action" => "share_registered", "gif_id" => gif_id})
        {:reply, {:text, response}, state}

      _ ->
        {:ok, state}
    end
  end

  def websocket_handle({:binary, data}, state) do
    case Msgpax.unpack(data) do
      {:ok, %{"action" => "search", "term" => term, "limit" => limit}} ->
        results = Urgif.GifService.search(term, limit)
        response = Msgpax.pack!(%{"action" => "results", "gifs" => results})
        {:reply, {:binary, response}, state}

      {:ok, %{"action" => "share", "gif_id" => gif_id, "search_term" => search_term}} ->
        Urgif.GifService.register_share(gif_id, search_term)
        response = Msgpax.pack!(%{"action" => "share_registered", "gif_id" => gif_id})
        {:reply, {:binary, response}, state}

      _ ->
        {:ok, state}
    end
  end

  def websocket_info(_info, state) do
    {:ok, state}
  end

  def terminate(_reason, _req, _state) do
    IO.puts("Client disconnected")
    :ok
  end
end

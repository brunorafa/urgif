defmodule Urgif.GifService do
  def search(term, limit) do
    Urgif.TenorClient.search(term, limit)
  end

  def register_share(gif_id, search_term) do
    Urgif.TenorClient.register_share(gif_id, search_term)
  end
end

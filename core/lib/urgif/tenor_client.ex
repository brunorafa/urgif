defmodule Urgif.TenorClient do
  @tenor_url Application.compile_env(:urgif, :tenor_url)

  require Logger

  def search(term, limit) do
    api_key = Application.get_env(:urgif, :tenor_api_key)
    client_key = Application.get_env(:urgif, :tenor_client_key)

    response =
      Req.get!(
        "#{@tenor_url}/search",
        params: [
          q: term,
          key: api_key,
          client_key: client_key,
          limit: limit,
          media_filter: "gif"
        ],
        retry: :transient,
        receive_timeout: 10_000
      )

    Logger.info("Response: #{inspect(response)}")

    parsed_gifs =
      response.body
      |> Map.get("results", [])
      |> Enum.map(&parse_gif/1)

    Logger.info("Parsed #{length(parsed_gifs)} GIFs for search term '#{term}'")
    parsed_gifs
  rescue
    error ->
      Logger.error("Error making API request: #{inspect(error)}")
      []
  end

  def register_share(gif_id, search_term) do
    api_key = Application.get_env(:urgif, :tenor_api_key)
    client_key = Application.get_env(:urgif, :tenor_client_key)

    response =
      Req.get!(
        "#{@tenor_url}/registershare",
        params: [
          id: gif_id,
          key: api_key,
          client_key: client_key,
          q: search_term
        ],
        retry: :transient,
        receive_timeout: 10_000
      )

    Logger.info("Share registered for GIF #{gif_id} with search term '#{search_term}'")
    response
  rescue
    error ->
      Logger.error("Error registering share: #{inspect(error)}")
      {:error, error}
  end

  defp parse_gif(result) do
    %{
      id: result["id"],
      url: result["media"][0]["gif"]["url"],
      preview: result["media"][0]["tinygif"]["url"],
      width: result["media"][0]["gif"]["dims"][0],
      height: result["media"][0]["gif"]["dims"][1]
    }
  end
end

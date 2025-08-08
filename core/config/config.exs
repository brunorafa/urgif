import Config

config :logger,
  level: :info,
  format: "$date $time [$level] $metadata$message\n"

config :urgif,
  tenor_url: "https://tenor.googleapis.com/v2",
  tenor_api_key: System.get_env("TENOR_API_KEY"),
  tenor_client_key: System.get_env("TENOR_CLIENT_KEY", "urgif")

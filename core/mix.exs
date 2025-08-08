defmodule Urgif.Core.MixProject do
  use Mix.Project

  def project do
    [
      app: :urgif,
      version: "0.1.0",
      elixir: "~> 1.18",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {Urgif.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:jason, "~> 1.4"},
      {:msgpax, "~> 2.0"},
      {:plug_cowboy, "~> 2.0"},
      {:req, "~> 0.5.0"},
      {:websockex, "~> 0.4.3"}
    ]
  end
end

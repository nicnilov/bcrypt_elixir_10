defmodule App.Mixfile do
  use Mix.Project

  def project do
    [
      app: :app,
      version: "0.0.1",
      elixir: "~> 1.7",
      build_embedded: Mix.env == :prod,
      start_permanent: Mix.env == :prod,
      deps: deps()
    ]
  end

  def application do
    [
      mod: {App, []},
      extra_applications: [:logger, :runtime_tools]
    ]
  end

  defp deps do
    [
      {:bcrypt_elixir, path: "../bcrypt_elixir"}
    ]
  end
end

defmodule Tipe.MixProject do
  use Mix.Project

  def project do
    [
      app: :tipe,
      version: "0.1.0",
      elixir: "~> 1.15",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      package: package(),

      # Docs
      name: "Tipe",
      source_url: "https://github.com/danj3/tipe/tree/v-0.1.0",
      docs: [
        main: "readme",
        extras: ["README.md"]
      ]
    ]
  end

  defp package do
    [
      exclude_patterns: [~r{.*~$}],
      description: description(),
      licenses: ["Apache-2.0"],
      links: %{
        "github" => "https://github.com/danj3/tipe"
      }
    ]
  end

  defp description do
    """
    Add skippable pipeline steps when :error or {:error,_} is present.
    """
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:ex_doc, ">= 0.0.0", only: :dev, runtime: false}
    ]
  end
end

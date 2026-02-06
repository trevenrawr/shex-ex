defmodule ShEx.MixProject do
  use Mix.Project

  @repo_url "https://github.com/rdf-elixir/shex-ex"

  @version File.read!("VERSION") |> String.trim()

  def project do
    [
      app: :shex,
      version: @version,
      elixir: "~> 1.19",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      elixirc_paths: elixirc_paths(Mix.env()),
      compilers: [:leex, :yecc] ++ Mix.compilers(),

      # Hex
      package: package(),
      description: description(),

      # Docs
      name: "ShEx.ex",
      docs: [
        main: "ShEx",
        source_url: @repo_url,
        source_ref: "v#{@version}",
        extras: ["CHANGELOG.md"]
      ]
    ]
  end

  defp description do
    """
    An implementation of ShEx for Elixir.
    """
  end

  defp package do
    [
      maintainers: ["Marcel Otto"],
      licenses: ["MIT"],
      links: %{
        "Homepage" => "https://rdf-elixir.dev",
        "GitHub" => @repo_url,
        "Changelog" => @repo_url <> "/blob/master/CHANGELOG.md"
      },
      files: ~w[lib src/*.xrl src/*.yrl mix.exs VERSION *.md]
    ]
  end

  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp deps do
    [
      {:rdf, "~> 2.0"},
      {:flow, "~> 1.2"},
      {:jason, "~> 1.4"},

      # Development
      {:credo, "~> 1.7", only: [:dev, :test], runtime: false},
      {:ex_doc, "~> 0.40", only: :dev, runtime: false}
    ]
  end

  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]
end

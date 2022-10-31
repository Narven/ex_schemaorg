defmodule ExSchemaorg do
  @moduledoc """
  Documentation for `ExSchemaorg`.
  """

  @context "http://schema.org"

  alias Jason
  alias Phoenix.HTML
  alias Phoenix.HTML.Tag

  @doc ~S"""
  Generates a script tag

  ## Examples

      iex> ExSchemaorg.script_jsonld("Person", %{name: "Somebody"})
      <script type="application/ld+json">
      {
        "@context": "http://schema.org",
        "@type": "Person",
        "name": "Kelly"
      }
      </script>
  """
  def script_jsonld(type, attrs \\ %{}) do
    content =
      %{
        "@context": @context,
        "@type": type
      }
      |> Map.merge(attrs)
      |> Jason.encode!()

    HTML.safe_to_string(Tag.content_tag(:script, content, type: "application/ld+json"))
  end
end

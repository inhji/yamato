defmodule YamatoWeb.ArticleView do
  use YamatoWeb, :view

  def markdown(body) when is_nil(body), do: "No excerpt"

  def markdown(body) do
    body
    |> Earmark.as_html!
    |> raw
  end

  def date_format(date) do
    Timex.format!(date, "{YYYY}-{0M}-{D}")
  end

  def tags_string(tags) when is_nil(tags), do: ""
  def tags_string(tags), do: Enum.join(tags, ",")

  def primary_tag(tags) when is_nil(tags), do: nil
  def primary_tag([]), do: nil
  def primary_tag([tag|_rest]) do
    tag
  end

  def secondary_tags(tags) when is_nil(tags), do: []
  def secondary_tags([]), do: []
  def secondary_tags([_tag|rest]) do
    rest
  end
end

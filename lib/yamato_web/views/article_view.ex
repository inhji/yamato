defmodule YamatoWeb.ArticleView do
  use YamatoWeb, :view

  def markdown(body) when is_nil(body), do: "No content!"

  def markdown(body) do
    body
    |> Earmark.as_html!
    |> raw
  end

  def date_format(date) do
    Timex.format!(date, "{D}. {Mshort} {YYYY}")
  end

  def tags_string(tags) when is_nil(tags), do: ""
  def tags_string(tags), do: Enum.join(tags, ",")
end

defmodule YamatoWeb.ArticleView do
  use YamatoWeb, :view

  def markdown(body) do
    body
    |> Earmark.as_html!
    |> raw
  end

  def date_format(date) do
    Timex.format!(date, "{YYYY}-{0M}-{D}")
  end

  def tags_string(tags) do
    Enum.join(tags, ",")
  end
end

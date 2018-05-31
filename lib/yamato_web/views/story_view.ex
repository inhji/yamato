defmodule YamatoWeb.StoryView do
  use YamatoWeb, :view

  def tags_string(tags) when is_nil(tags), do: ""
  def tags_string(tags), do: Enum.join(tags, ",")
end

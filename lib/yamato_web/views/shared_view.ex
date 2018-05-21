defmodule YamatoWeb.SharedView do
  use YamatoWeb, :view

  def primary_tag(tags) when is_nil(tags), do: nil
  def primary_tag([]), do: nil

  def primary_tag([tag | _rest]) do
    tag
  end

  def secondary_tags(tags) when is_nil(tags), do: []
  def secondary_tags([]), do: []

  def secondary_tags([_tag | rest]) do
    rest
  end
end

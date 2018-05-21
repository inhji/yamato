defmodule YamatoWeb.Helpers.Shared do
  def render_shared(template, assigns \\ []) do
    Phoenix.View.render(YamatoWeb.SharedView, template, assigns)
  end
end

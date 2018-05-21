defmodule YamatoWeb.LayoutView do
  use YamatoWeb, :view

  def body_class(path) do
    case path do
      "/" -> "index"
      _ -> nil
    end
  end
end

defmodule YamatoWeb.LayoutView do
  use YamatoWeb, :view

  def body_class(conn) do
    case conn.request_path do
      "/" -> "index"
      "/blog" -> "blog"
      _ -> nil
    end
  end

  def is_index?(conn) do
    conn.request_path == "/"
  end
end

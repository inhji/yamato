defmodule YamatoWeb.LayoutView do
  use YamatoWeb, :view

  def body_class(conn) do
    case conn.request_path do
      "/" -> "index"
      "/blog" -> "blog"
      _ -> nil
    end
  end

  def active_class(conn, path, additonal_classes \\ []) do
    if conn.request_path === path do
      Enum.join(["is-active" | additonal_classes], " ")
    else
      Enum.join(additonal_classes, " ")
    end
  end

  def is_index?(conn) do
    conn.request_path == "/"
  end
end

defmodule YamatoWeb.PageController do
  use YamatoWeb, :controller

  alias Yamato.Blog

  def index(conn, _params) do
    articles = Blog.list_articles()
    render(conn, "index.html", articles: articles)
  end

  def about(conn, _params) do
    render(conn, "about.html")
  end
end

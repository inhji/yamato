defmodule YamatoWeb.PageController do
  use YamatoWeb, :controller

  alias Yamato.Blog

  def index(conn, _params) do
    render(conn, "index.html")
  end

  def about(conn, _params) do
    render(conn, "about.html")
  end

  def blog(conn, _params) do
    articles = Blog.list_articles()
    render(conn, "blog.html", articles: articles)
  end
end

defmodule YamatoWeb.PageController do
  use YamatoWeb, :controller

  alias Yamato.{Blog, Notes, Stories}

  plug(YamatoWeb.Plugs.CheckAuth when action in [:admin])

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

  def admin(conn, _params) do
    articles = Blog.list_articles()
    notes = Notes.list_notes()
    stories = Stories.list_stories()
    render(conn, "admin.html", articles: articles, notes: notes, stories: stories)
  end
end

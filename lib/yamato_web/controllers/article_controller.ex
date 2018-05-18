defmodule YamatoWeb.ArticleController do
  use YamatoWeb, :controller

  alias Yamato.Blog
  alias Yamato.Blog.{Article, Comment}

  plug YamatoWeb.Plugs.CheckAuth when action in [:new, :create, :edit, :update, :delete]

  def index(conn, _params) do
    articles = Blog.list_articles()
    render(conn, "index.html", articles: articles)
  end

  def new(conn, _params) do
    changeset = Blog.change_article(%Article{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"article" => article_params}) do
    case Blog.create_article(article_params) do
      {:ok, article} ->
        conn
        |> put_flash(:info, "Article created successfully.")
        |> redirect(to: article_path(conn, :show, article))
      {:error, %Ecto.Changeset{} = changeset} ->
        conn
        |> render("new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    article = Blog.get_article!(id)
    comment_changeset = Comment.changeset(%Comment{})
    render(conn, "show.html", article: article, comment_changeset: comment_changeset)
  end

  def edit(conn, %{"id" => id}) do
    article = Blog.get_article!(id)
    changeset = Blog.change_article(article)
    render(conn, "edit.html", article: article, changeset: changeset)
  end

  def update(conn, %{"id" => id, "article" => article_params}) do
    article = Blog.get_article!(id)

    case Blog.update_article(article, article_params) do
      {:ok, article} ->
        conn
        |> put_flash(:info, "Article updated successfully.")
        |> redirect(to: article_path(conn, :show, article))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", article: article, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    article = Blog.get_article!(id)
    {:ok, _article} = Blog.delete_article(article)

    conn
    |> put_flash(:info, "Article deleted successfully.")
    |> redirect(to: article_path(conn, :index))
  end
end

defmodule YamatoWeb.CommentController do
  use YamatoWeb, :controller

  alias Yamato.Blog.Article
  alias Yamato.Repo

  def create(conn, %{"comment" => comment_params, "article_id" => article_id}) do
    article = Repo.get(Article, article_id)

    comment_changeset = Ecto.build_assoc(article, :comments, content: comment_params["content"])

    Repo.insert(comment_changeset)

    conn
    |> put_flash(:info, "Comment created")
    |> redirect(to: article_path(conn, :show, article))
  end
end

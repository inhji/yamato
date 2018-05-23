defmodule YamatoWeb.Blog.CommentController do
  use YamatoWeb, :controller

  alias Yamato.Blog
  alias Yamato.Blog.{Article, Comment}
  alias Yamato.Repo

  def create(conn, %{"comment" => comment_params, "article_id" => article_id}) do
    article = Repo.get(Article, article_id)

    Blog.create_comment(comment_params, article_id)

    conn
    |> put_flash(:info, "Comment created")
    |> redirect(to: blog_article_path(conn, :show, article))
  end

  def delete(conn, %{"id" => comment_id, "article_id" => article_id}) do
    comment = Repo.get(Comment, comment_id)
    article = Repo.get(Article, article_id)

    Blog.delete_comment(comment)

    conn
    |> put_flash(:info, "Comment deleted successfully.")
    |> redirect(to: blog_article_path(conn, :show, article))
  end
end

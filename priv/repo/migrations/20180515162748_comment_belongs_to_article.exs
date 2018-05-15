defmodule Yamato.Repo.Migrations.CommentBelongsToArticle do
  use Ecto.Migration

  def change do
    alter table(:comments) do
      add :article_id, references(:articles, on_delete: :delete_all)
    end
  end
end

defmodule Yamato.Repo.Migrations.AddExcerptToArticle do
  use Ecto.Migration

  def change do
    alter table(:articles) do
      add :excerpt, :text
    end
  end
end

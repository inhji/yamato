defmodule Yamato.Repo.Migrations.CreateArticleTags do
  use Ecto.Migration

  def change do
    create table(:article_tags) do

      timestamps()
    end

  end
end

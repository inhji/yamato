defmodule Yamato.Repo.Migrations.AddTagsToArticle do
  use Ecto.Migration

  def change do
    alter table(:articles) do
      add :tags, {:array, :string}
    end
  end
end

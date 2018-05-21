defmodule Yamato.Repo.Migrations.AddDraftToArticle do
  use Ecto.Migration

  def change do
    alter table(:articles) do
      add :draft, :boolean
    end
  end
end

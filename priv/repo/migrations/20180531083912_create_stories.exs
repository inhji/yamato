defmodule Yamato.Repo.Migrations.CreateStories do
  use Ecto.Migration

  def change do
    create table(:stories) do
      add(:name, :string)
      add(:content, :text)
      add(:excerpt, :text)
      add(:tags, {:array, :string})
      add(:draft, :boolean)

      timestamps()
    end
  end
end

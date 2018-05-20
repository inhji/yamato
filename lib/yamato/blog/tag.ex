defmodule Yamato.Blog.Tag do
  use Ecto.Schema
  import Ecto.Changeset


  schema "article_tags" do
    field :tags, {:array, :string}
    belongs_to :article, Yamato.Blog.Article

    timestamps()
  end

  @doc false
  def changeset(tag, attrs) do
    tag
    |> cast(attrs, [:tags])
    |> validate_required([:article])
  end
end

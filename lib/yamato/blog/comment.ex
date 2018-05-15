defmodule Yamato.Blog.Comment do
  use Ecto.Schema
  import Ecto.Changeset


  schema "comments" do
    field :author, :string
    field :content, :string
    belongs_to :article, Yamato.Blog.Article

    timestamps()
  end

  @doc false
  def changeset(comment, attrs \\ %{}) do
    comment
    |> cast(attrs, [:content, :author])
    |> validate_required([:content, :author])
  end
end

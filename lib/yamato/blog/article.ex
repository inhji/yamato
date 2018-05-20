defmodule Yamato.Blog.Article do
  use Ecto.Schema
  import Ecto.Changeset

  schema "articles" do
    field :title, :string
    field :content, :string
    field :excerpt, :string
    field :tags, {:array, :string}
    has_many :comments, Yamato.Blog.Comment

    timestamps()
  end

  @doc false
  def changeset(article, attrs) do
    article
    |> cast(attrs, [:title, :content, :excerpt, :tags])
    |> validate_required([:title, :content])
  end
end

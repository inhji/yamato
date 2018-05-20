defmodule Yamato.Blog.Article do
  use Ecto.Schema
  import Ecto.Changeset
  alias Yamato.Repo

  schema "articles" do
    field :title, :string
    field :content, :string
    field :excerpt, :string
    has_many :comments, Yamato.Blog.Comment
    has_one :tags, Yamato.Blog.Tag

    timestamps()
  end

  @doc false
  def changeset(article, attrs) do
    article
    |> Repo.preload(:tags)
    |> cast(attrs, [:title, :content, :excerpt])
    |> validate_required([:title, :content])
  end
end

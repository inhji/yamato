defmodule Yamato.Blog.Article do
  use Ecto.Schema
  import Ecto.Changeset
  alias Yamato.Helpers.Tags

  schema "articles" do
    field(:title, :string)
    field(:content, :string)
    field(:excerpt, :string)
    field(:tags, {:array, :string})
    field(:tags_string, :string, virtual: true, default: "")
    field(:draft, :boolean)
    has_many(:comments, Yamato.Blog.Comment)

    timestamps()
  end

  @doc false
  def changeset(article, attrs) do
    article
    |> cast(attrs, [:title, :content, :excerpt, :tags_string, :draft])
    |> validate_required([:title, :content])
    |> Tags.convert_tags_string_to_list()
  end
end

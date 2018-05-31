defmodule Yamato.Stories.Story do
  use Ecto.Schema
  import Ecto.Changeset
  alias Yamato.Helpers.Tags

  schema "stories" do
    field(:content, :string)
    field(:excerpt, :string)
    field(:name, :string)
    field(:tags, {:array, :string})
    field(:tags_string, :string, virtual: true, default: "")

    timestamps()
  end

  @doc false
  def changeset(story, attrs) do
    story
    |> cast(attrs, [:name, :content, :excerpt, :tags])
    |> validate_required([:name, :content])
    |> Tags.convert_tags_string_to_list()
  end
end

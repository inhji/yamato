defmodule Yamato.Notes.Note do
  use Ecto.Schema
  import Ecto.Changeset
  alias Yamato.Helpers.Tags

  schema "notes" do
    field(:content, :string)
    field(:tags, {:array, :string})
    field(:tags_string, :string, virtual: true, default: "")

    timestamps()
  end

  @doc false
  def changeset(note, attrs) do
    note
    |> cast(attrs, [:content, :tags])
    |> validate_required([:content])
    |> Tags.convert_tags_string_to_list()
  end
end

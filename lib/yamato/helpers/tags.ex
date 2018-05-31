defmodule Yamato.Helpers.Tags do
  import Ecto.Changeset

  def convert_tags_string_to_list(changeset) do
    tags_string = get_field(changeset, :tags_string)
    tags_list = String.split(tags_string, ",", trim: true)
    put_change(changeset, :tags, tags_list)
  end
end

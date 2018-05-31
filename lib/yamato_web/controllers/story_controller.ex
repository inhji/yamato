defmodule YamatoWeb.StoryController do
  use YamatoWeb, :controller

  alias Yamato.Stories
  alias Yamato.Stories.Story

  plug(YamatoWeb.Plugs.CheckAuth when action in [:new, :create, :edit, :update, :delete])

  def index(conn, _params) do
    stories = Stories.list_stories()
    render(conn, "index.html", stories: stories)
  end

  def new(conn, _params) do
    changeset = Stories.change_story(%Story{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"story" => story_params}) do
    case Stories.create_story(story_params) do
      {:ok, story} ->
        conn
        |> put_flash(:info, "Story created successfully.")
        |> redirect(to: story_path(conn, :show, story))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    story = Stories.get_story!(id)
    render(conn, "show.html", story: story)
  end

  def edit(conn, %{"id" => id}) do
    story = Stories.get_story!(id)
    changeset = Stories.change_story(story)
    render(conn, "edit.html", story: story, changeset: changeset)
  end

  def update(conn, %{"id" => id, "story" => story_params}) do
    story = Stories.get_story!(id)

    case Stories.update_story(story, story_params) do
      {:ok, story} ->
        conn
        |> put_flash(:info, "Story updated successfully.")
        |> redirect(to: story_path(conn, :show, story))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", story: story, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    story = Stories.get_story!(id)
    {:ok, _story} = Stories.delete_story(story)

    conn
    |> put_flash(:info, "Story deleted successfully.")
    |> redirect(to: story_path(conn, :index))
  end
end

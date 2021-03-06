defmodule Yamato.StoriesTest do
  use Yamato.DataCase

  alias Yamato.Stories

  describe "stories" do
    alias Yamato.Stories.Story

    @valid_attrs %{content: "some content", excerpt: "some excerpt", name: "some name"}
    @update_attrs %{content: "some updated content", excerpt: "some updated excerpt", name: "some updated name"}
    @invalid_attrs %{content: nil, excerpt: nil, name: nil}

    def story_fixture(attrs \\ %{}) do
      {:ok, story} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Stories.create_story()

      story
    end

    test "list_stories/0 returns all stories" do
      story = story_fixture()
      assert Stories.list_stories() == [story]
    end

    test "get_story!/1 returns the story with given id" do
      story = story_fixture()
      assert Stories.get_story!(story.id) == story
    end

    test "create_story/1 with valid data creates a story" do
      assert {:ok, %Story{} = story} = Stories.create_story(@valid_attrs)
      assert story.content == "some content"
      assert story.excerpt == "some excerpt"
      assert story.name == "some name"
    end

    test "create_story/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Stories.create_story(@invalid_attrs)
    end

    test "update_story/2 with valid data updates the story" do
      story = story_fixture()
      assert {:ok, story} = Stories.update_story(story, @update_attrs)
      assert %Story{} = story
      assert story.content == "some updated content"
      assert story.excerpt == "some updated excerpt"
      assert story.name == "some updated name"
    end

    test "update_story/2 with invalid data returns error changeset" do
      story = story_fixture()
      assert {:error, %Ecto.Changeset{}} = Stories.update_story(story, @invalid_attrs)
      assert story == Stories.get_story!(story.id)
    end

    test "delete_story/1 deletes the story" do
      story = story_fixture()
      assert {:ok, %Story{}} = Stories.delete_story(story)
      assert_raise Ecto.NoResultsError, fn -> Stories.get_story!(story.id) end
    end

    test "change_story/1 returns a story changeset" do
      story = story_fixture()
      assert %Ecto.Changeset{} = Stories.change_story(story)
    end
  end
end

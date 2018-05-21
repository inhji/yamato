defmodule YamatoWeb.UserController do
  use YamatoWeb, :controller

  alias Yamato.Accounts
  alias Yamato.Accounts.User

  plug(:user_already_exists)

  defp user_already_exists(conn, _params) do
    if length(Yamato.Accounts.list_users()) > 0 do
      conn
      |> put_flash(:error, "Sorry, you can't register!")
      |> redirect(to: "/")
      |> halt()
    else
      conn
    end
  end

  def new(conn, _params) do
    changeset = Accounts.change_user(%User{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"user" => user_params}) do
    case Accounts.create_user(user_params) do
      {:ok, user} ->
        conn
        |> put_session(:current_user_id, user.id)
        |> put_flash(:info, "User created successfully.")
        |> redirect(to: page_path(conn, :index))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end
end

defmodule YamatoWeb.Plugs.CheckAuth do
  import Plug.Conn
  import Phoenix.Controller, only: [put_flash: 3, redirect: 2]
  import YamatoWeb.Router.Helpers

  def init(default), do: default

  def call(conn, _default) do
    if user_id = get_session(conn, :current_user_id) do
      current_user = Yamato.Accounts.get_user!(user_id)

      conn
      |> assign(:current_user, current_user)
    else
      conn
      |> put_flash(:error, "You need to be signed in to do that")
      |> redirect(to: page_path(conn, :index))
      |> halt()
    end
  end
end

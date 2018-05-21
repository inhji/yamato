defmodule YamatoWeb.Helpers.Auth do
  alias Yamato.Accounts.User
  alias Yamato.Repo

  def signed_in?(conn) do
    user_id = Plug.Conn.get_session(conn, :current_user_id)
    if user_id, do: !!Repo.get(User, user_id)
  end
end

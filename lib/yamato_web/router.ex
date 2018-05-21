defmodule YamatoWeb.Router do
  use YamatoWeb, :router

  pipeline :browser do
    plug(:accepts, ["html"])
    plug(:fetch_session)
    plug(:fetch_flash)
    plug(:protect_from_forgery)
    plug(:put_secure_browser_headers)
    plug(:assign_path)
  end

  pipeline :api do
    plug(:accepts, ["json"])
  end

  defp assign_path(conn, _opts) do
    conn
    |> assign(:path, conn.request_path)
  end

  scope "/", YamatoWeb do
    # Use the default browser stack
    pipe_through(:browser)

    get("/", PageController, :index)
    get("/about", PageController, :about)

    resources "/articles", ArticleController do
      resources("/comments", CommentController, only: [:create, :delete])
    end

    resources("/registrations", UserController, only: [:new, :create])

    get("/auth/login", SessionController, :new)
    post("/auth/login", SessionController, :create)
    delete("/auth/logout", SessionController, :delete)
  end

  # Other scopes may use custom stacks.
  # scope "/api", YamatoWeb do
  #   pipe_through :api
  # end
end

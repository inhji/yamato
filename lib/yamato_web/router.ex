defmodule YamatoWeb.Router do
  use YamatoWeb, :router

  pipeline :browser do
    plug(:accepts, ["html"])
    plug(:fetch_session)
    plug(:fetch_flash)
    plug(:protect_from_forgery)
    plug(:put_secure_browser_headers)
  end

  pipeline :api do
    plug(:accepts, ["json"])
  end

  scope "/", YamatoWeb do
    # Use the default browser stack
    pipe_through(:browser)

    get("/", PageController, :index)
    get("/about", PageController, :about)
    get("/blog", PageController, :blog)

    resources "/articles", ArticleController do
      resources("/comments", CommentController, only: [:create, :delete])
    end

    resources("/notes", NoteController)
    resources("/images", ImageController)
    resources("/stories", StoryController)

    get("/auth/register", UserController, :new)
    post("/auth/register", UserController, :create)
    get("/auth/login", SessionController, :new)
    post("/auth/login", SessionController, :create)
    delete("/auth/logout", SessionController, :delete)
  end

  # Other scopes may use custom stacks.
  # scope "/api", YamatoWeb do
  #   pipe_through :api
  # end
end

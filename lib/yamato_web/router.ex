defmodule YamatoWeb.Router do
  use YamatoWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", YamatoWeb do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index

    resources "/articles", ArticleController

    resources "/registrations", UserController, only: [:new, :create]

    get "/auth/login", SessionController, :new
    post "/auth/login", SessionController, :create
    delete "/auth/logout", SessionController, :delete
  end

  # Other scopes may use custom stacks.
  # scope "/api", YamatoWeb do
  #   pipe_through :api
  # end
end

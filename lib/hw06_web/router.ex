defmodule Hw06Web.Router do
  use Hw06Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug Hw06Web.Plugs.FetchSession
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", Hw06Web do
    pipe_through :browser

    get "/", PageController, :index
    get "/login", SessionController, :login
    resources "/users", UserController
    resources "/sessions", SessionController, only: [:create, :delete], singleton: true
    resources "/todo-items", TodoItemController
  end

  # Other scopes may use custom stacks.
  # scope "/api", Hw06Web do
  #   pipe_through :api
  # end
end

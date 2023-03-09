defmodule LMMWeb.Router do
  use LMMWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", LMMWeb do
    pipe_through :api
  end
end

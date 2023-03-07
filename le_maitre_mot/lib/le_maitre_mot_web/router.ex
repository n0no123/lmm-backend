defmodule LeMaitreMotWeb.Router do
  use LeMaitreMotWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", LeMaitreMotWeb do
    pipe_through :api
  end
end

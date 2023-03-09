# This file is responsible for configuring your application
# and its dependencies with the aid of the Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
import Config

config :le_maitre_mot,
  namespace: LMM,
  ecto_repos: [LMM.Repo]

# Configures the endpoint
config :le_maitre_mot, LMMWeb.Endpoint,
  url: [host: "localhost"],
  render_errors: [
    formats: [json: LMMWeb.ErrorJSON],
    layout: false
  ],
  pubsub_server: LMM.PubSub,
  live_view: [signing_salt: "Zl2UGQ1R"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{config_env()}.exs"

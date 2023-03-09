import Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :le_maitre_mot, LeMaitreMotWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "PVgIM8TflDcKuyvXyn4LWBo1p12N1YiHLFK1cX0kYoC7F4rVtzqbPoLA6bW8K/XN",
  server: false

# Print only warnings and errors during test
config :logger, level: :warning

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime

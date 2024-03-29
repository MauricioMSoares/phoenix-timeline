import Config

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
config :phoenix_timeline, PhoenixTimeline.Repo,
  username: "postgres",
  password: "1234",
  hostname: "localhost",
  database: "phoenix_timeline_test#{System.get_env("MIX_TEST_PARTITION")}",
  pool: Ecto.Adapters.SQL.Sandbox,
  pool_size: System.schedulers_online() * 2

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :phoenix_timeline, PhoenixTimelineWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "pfTDCA6tMbXwi9TsmU2T3pLKekHkPy7eIVUa5wDkPbBe5XUykWZJwxBXWcr4vIi2",
  server: false

# In test we don't send emails.
config :phoenix_timeline, PhoenixTimeline.Mailer, adapter: Swoosh.Adapters.Test

# Disable swoosh api client as it is only required for production adapters.
config :swoosh, :api_client, false

# Print only warnings and errors during test
config :logger, level: :warning

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime

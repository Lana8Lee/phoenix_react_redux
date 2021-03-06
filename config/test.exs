use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :phoenix_react_redux, PhoenixReactRedux.Endpoint,
  http: [port: 4001],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :phoenix_react_redux, PhoenixReactRedux.Repo,
  adapter: Ecto.Adapters.Postgres,
  pool: Ecto.Adapters.SQL.Sandbox,
  url: (System.get_env("DATABASE_URL") || "postgres://localhost:5432/phoenix_react_redux_dev")

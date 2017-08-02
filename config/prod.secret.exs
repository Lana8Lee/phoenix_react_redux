use Mix.Config

# In this file, we keep production configuration that
# you likely want to automate and keep it away from
# your version control system.
#
# You should document the content of this
# file or create a script for recreating it, since it's
# kept out of version control and might be hard to recover
# or recreate for your teammates (or you later on).
config :phoenix_react_redux, PhoenixReactRedux.Endpoint,
  secret_key_base: "+FpUwkkzx/EYpgWoVNzgmDYbTHIQ4jTyRoKulsMXp7fE5Z+ze/9vspaf1NqXAjMF"

# Configure your database
config :phoenix_react_redux, PhoenixReactRedux.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "phoenix_react_redux_prod",
  pool_size: 20

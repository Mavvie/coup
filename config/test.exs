use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :coup, CoupWeb.Endpoint,
  http: [port: 4001],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :coup, Coup.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "tyler",
  password: "",
  database: "coup_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox

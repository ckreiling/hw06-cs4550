# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :hw06,
  ecto_repos: [Hw06.Repo]

# Configures the endpoint
config :hw06, Hw06Web.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "+iCC2y3Qan68vY0eW3m6HkfJZ9PtPz5+YvcVgJ2ogPwoX0dwQ5s0TV+d2VF2O5iD",
  render_errors: [view: Hw06Web.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Hw06.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix and Ecto
config :phoenix, :json_library, Jason
config :ecto, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"

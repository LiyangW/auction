# This file is responsible for configuring your umbrella
# and **all applications** and their dependencies with the
# help of Mix.Config.
#
# Note that all applications in your umbrella share the
# same configuration and dependencies, which is why they
# all use the same configuration file. If you want different
# configurations or dependencies per app, it is best to
# move said applications out of the umbrella.
use Mix.Config

# Configure Mix tasks and generators
config :tes,
  ecto_repos: [Tes.Repo]

config :tes_web,
  ecto_repos: [Tes.Repo],
  generators: [context_app: :tes]

# Configures the endpoint
config :tes_web, TesWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "p+/UK08L0SYjfFJncRjXE1hgxiYNP+l235zyIug/AVj0S9dPT3mLQfuAWcgIGwEb",
  render_errors: [view: TesWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Tes.PubSub,
  live_view: [signing_salt: "QgwNlSXd"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"

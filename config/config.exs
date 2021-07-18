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
config :auction,
  ecto_repos: [Auction.Repo]

config :auction_web,
  ecto_repos: [Auction.Repo],
  generators: [context_app: :auction]

# Configures the endpoint
config :auction_web, AuctionWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "DFTc0GFzjByaXa7hWSrmF6D5uA+1qb/L91hmi4vgAYdM59+KVoCK6+Ui3rPve0BB",
  render_errors: [view: AuctionWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Auction.PubSub,
  live_view: [signing_salt: "/Pixslp8"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"

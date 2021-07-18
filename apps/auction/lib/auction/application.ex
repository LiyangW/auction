defmodule Auction.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      Auction.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: Auction.PubSub}
      # Start a worker by calling: Auction.Worker.start_link(arg)
      # {Auction.Worker, arg}
    ]

    Supervisor.start_link(children, strategy: :one_for_one, name: Auction.Supervisor)
  end
end

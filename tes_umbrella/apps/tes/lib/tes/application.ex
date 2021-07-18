defmodule Tes.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      Tes.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: Tes.PubSub}
      # Start a worker by calling: Tes.Worker.start_link(arg)
      # {Tes.Worker, arg}
    ]

    Supervisor.start_link(children, strategy: :one_for_one, name: Tes.Supervisor)
  end
end

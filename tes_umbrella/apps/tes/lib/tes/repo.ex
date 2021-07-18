defmodule Tes.Repo do
  use Ecto.Repo,
    otp_app: :tes,
    adapter: Ecto.Adapters.Postgres
end

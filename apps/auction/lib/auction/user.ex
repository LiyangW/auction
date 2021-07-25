defmodule Auction.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :username, :string
    field :email_address, :string
    field :password, :string, virtual: true
    field :password_hash, :string
    timestamps()
  end

  def changeset(user, params \\ %{}) do
    user
    |> cast(params, [:username, :email_address])
    |> validate_required([:username, :email_address, :password_hash])
    |> validate_length(:username, min: 3)
    |> unique_constraint(:username)
  end

  def changeset_with_password(user, params \\ %{}) do
    user
    |> cast(params, [:password])
    |> validate_required(:password)
    |> validate_length(:password, min: 5)
    |> validate_confirmation(:password, required: true)
    |> put_pass_hash()
    |> changeset(params)
  end

  defp put_pass_hash(%Ecto.Changeset{valid?: true, changes: %{password: password}} = changeset) do
    changeset
    |> put_change(:password_hash, Auction.Password.hash(password))
  end

  defp put_pass_hash(changeset), do: changeset
end

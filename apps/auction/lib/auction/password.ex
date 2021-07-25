defmodule Auction.Password do
  import Argon2

  def hash(password) do
    %{password_hash: password_hash} = add_hash(password)
    password_hash
  end

  def verify_with_hash(password, password_hash) do
    verify_pass(password, password_hash)
  end

  def dummy_verify() do
    no_user_verify()
  end
end

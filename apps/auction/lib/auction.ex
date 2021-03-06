defmodule Auction do
  @moduledoc """
  Documentation for Auction.
  """

  alias Auction.Item
  @repo Auction.Repo
  def list_items do
    @repo.all(Item)
  end

  def get_item(id) do
    @repo.get!(Item, id)
  end

  def get_item_by(attrs) do
    @repo.get_by(Item, attrs)
  end

  def insert_item(attrs) do
    Item
    |> struct(attrs)
    |> @repo.insert()
  end

  @spec delete_item(any) :: none
  def delete_item(%Item{} = item) do
    @repo.delete(item)
  end

  def update_item(%Auction.Item{} = item, updates) do
    item
    |> Item.changeset(updates)
    |> @repo.update
  end
end

defmodule GreenMarket.OrdersFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `GreenMarket.Orders` context.
  """

  @doc """
  Generate a order.
  """
  def order_fixture(attrs \\ %{}) do
    {:ok, order} =
      attrs
      |> Enum.into(%{
        date: ~D[2022-12-06],
        items: []
      })
      |> GreenMarket.Orders.create_order()

    order
  end
end

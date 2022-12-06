defmodule GreenMarket.ProductDBFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `GreenMarket.ProductDB` context.
  """

  @doc """
  Generate a category.
  """
  def category_fixture(attrs \\ %{}) do
    {:ok, category} =
      attrs
      |> Enum.into(%{
        name: "some name"
      })
      |> GreenMarket.ProductDB.create_category()

    category
  end

  @doc """
  Generate a product.
  """
  def product_fixture(attrs \\ %{}) do
    {:ok, product} =
      attrs
      |> Enum.into(%{
        image: "some image",
        name: "some name",
        price: 120.5,
        quantity: 42
      })
      |> GreenMarket.ProductDB.create_product()

    product
  end
end

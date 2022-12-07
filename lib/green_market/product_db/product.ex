defmodule GreenMarket.ProductDB.Product do
  use Ecto.Schema
  import Ecto.Changeset

  schema "products" do
    field :image, :string
    field :name, :string
    field :price, :float
    field :quantity, :integer
    field :category_id, :id

    timestamps()
  end

  @doc false
  def changeset(product, attrs) do
    product
    |> cast(attrs, [:name, :image, :quantity, :price, :category_id])
    |> validate_required([:name, :image, :quantity, :price, :category_id])
  end
end

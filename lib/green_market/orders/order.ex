defmodule GreenMarket.Orders.Order do
  use Ecto.Schema
  import Ecto.Changeset

  schema "orders" do
    field :date, :date
    field :items, {:array, {:array, :integer}}
    field :user_id, :id

    timestamps()
  end

  @doc false
  def changeset(order, attrs) do
    order
    |> cast(attrs, [:date, :items, :user_id])
    |> validate_required([:date, :items, :user_id])
  end
end

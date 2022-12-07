defmodule GreenMarketWeb.ProductController do
  use GreenMarketWeb, :controller

  alias GreenMarket.ProductDB
  alias GreenMarket.ProductDB.Product

  def index(conn, _params) do
    products = ProductDB.list_products()
    categories = ProductDB.list_categories()
    render(conn, "index.html", products: products, categories: categories)
  end

  def new(conn, _params) do
    changeset = ProductDB.change_product(%Product{})
    categories = ProductDB.list_categories()
    render(conn, "new.html", changeset: changeset, categories: categories)
  end

  def create(conn, %{"product" => product_params}) do
    case ProductDB.create_product(product_params) do
      {:ok, product} ->
        conn
        |> put_flash(:info, "Product created successfully.")
        |> redirect(to: Routes.product_path(conn, :show, product))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    product = ProductDB.get_product!(id)
    category_id = product.category_id
    category_name = ProductDB.get_category!(category_id).name
    render(conn, "show.html", product: product, category_name: category_name)
  end

  def edit(conn, %{"id" => id}) do
    product = ProductDB.get_product!(id)
    categories = ProductDB.list_categories()
    changeset = ProductDB.change_product(product)
    render(conn, "edit.html", product: product, changeset: changeset, categories: categories)
  end

  def update(conn, %{"id" => id, "product" => product_params}) do
    product = ProductDB.get_product!(id)

    case ProductDB.update_product(product, product_params) do
      {:ok, product} ->
        conn
        |> put_flash(:info, "Product updated successfully.")
        |> redirect(to: Routes.product_path(conn, :show, product))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", product: product, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    product = ProductDB.get_product!(id)
    {:ok, _product} = ProductDB.delete_product(product)

    conn
    |> put_flash(:info, "Product deleted successfully.")
    |> redirect(to: Routes.product_path(conn, :index))
  end
end

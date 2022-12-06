defmodule GreenMarket.ProductDBTest do
  use GreenMarket.DataCase

  alias GreenMarket.ProductDB

  describe "categories" do
    alias GreenMarket.ProductDB.Category

    import GreenMarket.ProductDBFixtures

    @invalid_attrs %{name: nil}

    test "list_categories/0 returns all categories" do
      category = category_fixture()
      assert ProductDB.list_categories() == [category]
    end

    test "get_category!/1 returns the category with given id" do
      category = category_fixture()
      assert ProductDB.get_category!(category.id) == category
    end

    test "create_category/1 with valid data creates a category" do
      valid_attrs = %{name: "some name"}

      assert {:ok, %Category{} = category} = ProductDB.create_category(valid_attrs)
      assert category.name == "some name"
    end

    test "create_category/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = ProductDB.create_category(@invalid_attrs)
    end

    test "update_category/2 with valid data updates the category" do
      category = category_fixture()
      update_attrs = %{name: "some updated name"}

      assert {:ok, %Category{} = category} = ProductDB.update_category(category, update_attrs)
      assert category.name == "some updated name"
    end

    test "update_category/2 with invalid data returns error changeset" do
      category = category_fixture()
      assert {:error, %Ecto.Changeset{}} = ProductDB.update_category(category, @invalid_attrs)
      assert category == ProductDB.get_category!(category.id)
    end

    test "delete_category/1 deletes the category" do
      category = category_fixture()
      assert {:ok, %Category{}} = ProductDB.delete_category(category)
      assert_raise Ecto.NoResultsError, fn -> ProductDB.get_category!(category.id) end
    end

    test "change_category/1 returns a category changeset" do
      category = category_fixture()
      assert %Ecto.Changeset{} = ProductDB.change_category(category)
    end
  end

  describe "products" do
    alias GreenMarket.ProductDB.Product

    import GreenMarket.ProductDBFixtures

    @invalid_attrs %{image: nil, name: nil, price: nil, quantity: nil}

    test "list_products/0 returns all products" do
      product = product_fixture()
      assert ProductDB.list_products() == [product]
    end

    test "get_product!/1 returns the product with given id" do
      product = product_fixture()
      assert ProductDB.get_product!(product.id) == product
    end

    test "create_product/1 with valid data creates a product" do
      valid_attrs = %{image: "some image", name: "some name", price: 120.5, quantity: 42}

      assert {:ok, %Product{} = product} = ProductDB.create_product(valid_attrs)
      assert product.image == "some image"
      assert product.name == "some name"
      assert product.price == 120.5
      assert product.quantity == 42
    end

    test "create_product/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = ProductDB.create_product(@invalid_attrs)
    end

    test "update_product/2 with valid data updates the product" do
      product = product_fixture()
      update_attrs = %{image: "some updated image", name: "some updated name", price: 456.7, quantity: 43}

      assert {:ok, %Product{} = product} = ProductDB.update_product(product, update_attrs)
      assert product.image == "some updated image"
      assert product.name == "some updated name"
      assert product.price == 456.7
      assert product.quantity == 43
    end

    test "update_product/2 with invalid data returns error changeset" do
      product = product_fixture()
      assert {:error, %Ecto.Changeset{}} = ProductDB.update_product(product, @invalid_attrs)
      assert product == ProductDB.get_product!(product.id)
    end

    test "delete_product/1 deletes the product" do
      product = product_fixture()
      assert {:ok, %Product{}} = ProductDB.delete_product(product)
      assert_raise Ecto.NoResultsError, fn -> ProductDB.get_product!(product.id) end
    end

    test "change_product/1 returns a product changeset" do
      product = product_fixture()
      assert %Ecto.Changeset{} = ProductDB.change_product(product)
    end
  end
end

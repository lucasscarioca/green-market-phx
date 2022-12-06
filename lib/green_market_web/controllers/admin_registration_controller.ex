defmodule GreenMarketWeb.AdminRegistrationController do
  use GreenMarketWeb, :controller

  alias GreenMarket.Admin_accounts
  alias GreenMarket.Admin_accounts.Admin
  alias GreenMarketWeb.AdminAuth

  def new(conn, _params) do
    changeset = Admin_accounts.change_admin_registration(%Admin{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"admin" => admin_params}) do
    case Admin_accounts.register_admin(admin_params) do
      {:ok, admin} ->
        {:ok, _} =
          Admin_accounts.deliver_admin_confirmation_instructions(
            admin,
            &Routes.admin_confirmation_url(conn, :edit, &1)
          )

        conn
        |> put_flash(:info, "Admin created successfully.")
        |> AdminAuth.log_in_admin(admin)

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end
end

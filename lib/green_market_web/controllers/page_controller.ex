defmodule GreenMarketWeb.PageController do
  use GreenMarketWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end

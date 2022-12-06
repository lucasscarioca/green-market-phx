defmodule GreenMarket.Repo do
  use Ecto.Repo,
    otp_app: :green_market,
    adapter: Ecto.Adapters.Postgres
end

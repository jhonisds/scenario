defmodule Scenario.Repo do
  use Ecto.Repo,
    otp_app: :scenario,
    adapter: Ecto.Adapters.Postgres
end

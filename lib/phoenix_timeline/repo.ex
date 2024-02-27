defmodule PhoenixTimeline.Repo do
  use Ecto.Repo,
    otp_app: :phoenix_timeline,
    adapter: Ecto.Adapters.Postgres
end

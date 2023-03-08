defmodule Publisher.Repo do
  use Ecto.Repo,
    otp_app: :publisher,
    adapter: Ecto.Adapters.Postgres
end

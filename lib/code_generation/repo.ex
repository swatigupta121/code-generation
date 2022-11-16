defmodule CodeGeneration.Repo do
  use Ecto.Repo,
    otp_app: :code_generation,
    adapter: Ecto.Adapters.Postgres
end

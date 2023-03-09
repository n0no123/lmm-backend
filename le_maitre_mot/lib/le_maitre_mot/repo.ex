defmodule LMM.Repo do
  use Ecto.Repo,
    otp_app: :le_maitre_mot,
    adapter: Ecto.Adapters.Postgres
end

defmodule LMM.Repo.Migrations.CreateWords do
  use Ecto.Migration

  def change do
    create table(:words) do
      add :value, :string

      timestamps()
    end
  end
end

defmodule Coup.Repo.Migrations.CreateCards do
  use Ecto.Migration

  def change do
    create table(:cards) do
      add :kind, :string, null: false
      add :player_id, references(:players, on_delete: :delete_all)

      timestamps()
    end

    create index(:cards, [:player_id])
  end
end
